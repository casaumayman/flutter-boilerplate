//
//  NFCReader.swift
//  Runner
//
//  Created by Huynh Huy Tuan on 24/05/2022.
//

import Foundation
import libjeid
import CoreNFC

@available(iOS 13.0, *)
class NFCReader: NSObject, NFCTagReaderSessionDelegate {
    
    let DPIN = "****"
    var session: NFCTagReaderSession?
    private var pin1: String?
    private var pin2: String?
    private var call: FlutterMethodCall?
    private var result: FlutterResult?
    
    override init() {
        
    }
    
    public func setEnviroment(pin1input: String, pin2input: String, call: FlutterMethodCall, result: @escaping FlutterResult) {
        pin1 = pin1input
        pin2 = pin2input
        self.call = call
        self.result = result
    }
    
    private func responseError(message: String) {
        self.result?(FlutterError(code: "SCAN_NFC", message: message, details: nil))
    }
    
    public func scanRequest() {
        if (!NFCReaderSession.readingAvailable) {
            responseError(message: "お使いの端末はNFCに対応していません。")
            return
        }
        if let _ = self.session {
            responseError(message: "しばらく待ってから再度お試しください")
        } else {
            self.session = NFCTagReaderSession(pollingOption: [.iso14443], delegate: self, queue: DispatchQueue.global())
            self.session?.alertMessage = "免許証に端末をかざしてください"
            self.session?.begin()
        }
    }
    
    func tagReaderSessionDidBecomeActive(_ session: NFCTagReaderSession) {
        print("tagReaderSessionDidBecomeActive: \(Thread.current)")
    }
    
    func tagReaderSession(_ session: NFCTagReaderSession, didInvalidateWithError error: Error) {
        if let nfcError = error as? NFCReaderError {
            if nfcError.code != .readerSessionInvalidationErrorUserCanceled {
                print("tagReaderSession error: " + nfcError.localizedDescription)
                print("エラー: " + nfcError.localizedDescription)
                responseError(message: nfcError.localizedDescription)
            }
        } else {
            responseError(message: error.localizedDescription)
            print("tagReaderSession error: " + error.localizedDescription)
        }
        responseError(message: error.localizedDescription)
        self.session = nil
    }
    
    func tagReaderSession(_ session: NFCTagReaderSession, didDetect tags: [NFCTag]) {
        let msgReadingHeader = "読み取り中\n"
        let msgErrorHeader = "エラー\n"
        print("reader session thread: \(Thread.current)")
        let tag = tags.first!
        session.connect(to: tag) { (error: Error?) in
            print("connect thread: \(Thread.current)")
            if error != nil {
                print(error!)
                session.invalidate(errorMessage: "connect error")
                return
            }
            do {
                let reader = try JeidReader(tag)
                session.alertMessage = "読み取り開始..."
                let cardType = try reader.detectCardType()
                if (cardType != CardType.DL) {
                    session.invalidate(errorMessage: "\(msgErrorHeader)運転免許証ではありません")
                    return
                }
                print("thread: \(Thread.current)")
                let ap = try reader.selectDL()

                // PINを入力せず共通データ要素を読み出す場合は、
                // DriverLicenseAP.readCommonData()を利用できます
                // PIN1を入力せずにDriverLicenseAP.readFiles()を実行した場合、
                // 共通データ要素と暗証番号(PIN)設定のみを読み出します。
                session.alertMessage = "\(msgReadingHeader)共通データ要素と暗証番号(PIN)設定..."
                let freeFiles = try ap.readFiles()
                session.alertMessage += "成功"
                let pinSetting = try freeFiles.getPinSetting()
                do {
                    if !pinSetting.isPinSet {
                        self.pin1 = self.DPIN
                    }
                    session.alertMessage = "\(msgReadingHeader)暗証番号1による認証..."
                    try ap.verifyPin1(self.pin1!)
                    session.alertMessage += "成功"
                } catch let jeidError as JeidError {
                    switch jeidError {
                    case .invalidPin:
                        session.invalidate(errorMessage: "\(msgErrorHeader)認証失敗(暗証番号1)")
                        self.handleInvalidPinError(jeidError, 1)
                        return
                    default:
                        throw jeidError
                    }
                }

                do {
                    if !pinSetting.isPinSet {
                        self.pin2 = self.DPIN
                    }
                    session.alertMessage = "\(msgReadingHeader)暗証番号2による認証..."
                    try ap.verifyPin2(self.pin2!)
                    session.alertMessage += "成功"
                } catch let jeidError as JeidError {
                    switch jeidError {
                    case .invalidPin:
                        session.invalidate(errorMessage: "\(msgErrorHeader)認証失敗(暗証番号2)")
                        self.handleInvalidPinError(jeidError, 2)
                        return
                    default:
                        throw jeidError
                    }
                }

                session.alertMessage = "\(msgReadingHeader)ファイルの読み出し..."
                let files = try ap.readFiles()
                session.alertMessage += "成功"
                let entries = try files.getEntries()
                let changedEntries = try files.getChangedEntries()
                session.alertMessage = "読み取り完了"
                session.invalidate()
                let dataResponse: Dictionary<String, String> = [
                    "name": entries.name.toString(),
                    "kana": entries.kana ?? "",
                    "birthDate": entries.birthDate?.stringValue ?? "",
                    "address": entries.address.toString(),
                    "expireDate": entries.expireDate?.stringValue ?? "",
                    "licenseNumber": entries.licenseNumber ?? "",
                    "changedEntries": changedEntries.description
                ]
                if let jsonData = try? JSONSerialization.data(withJSONObject: dataResponse, options: []) {
                    let jsonString = String(data: jsonData, encoding: .utf8)
                    self.result?(jsonString)
                } else {
                    self.responseError(message: "Cannot serialize data")
                }
            } catch {
                session.invalidate(errorMessage: session.alertMessage + "失敗")
            }
        }
    }
    
    func handleInvalidPinError(_ jeidError: JeidError, _ pinIndex: Int) {
        let title: String
        let message: String
        guard case .invalidPin(let counter) = jeidError else {
            print("unexpected error: \(jeidError)")
            return
        }
        if (jeidError.isBlocked!) {
            title = "暗証番号\(pinIndex)がブロックされています"
            message = "警察署でブロック解除の申請を行ってください。"
        } else {
            title = "暗証番号\(pinIndex)が間違っています"
            message = "暗証番号\(pinIndex)を正しく入力してください。\n"
                + "残り\(counter)回間違えるとブロックされます。"
        }
        responseError(message: "\(title). \(message)")
    }
}

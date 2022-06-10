import UIKit
import Flutter

@available(iOS 13.0, *)
@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  let scanner = NFCReader()
    
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
      let scanNFCChannel = FlutterMethodChannel(name: "com.example.car_cleaning_demo_flutter.chanel",
                                                binaryMessenger: controller.binaryMessenger)
      scanNFCChannel.setMethodCallHandler({ [self]
        (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
          switch call.method {
          case "TEST_COMMUNICATE":
              if let params = call.arguments as? Dictionary<String, Bool> {
                  print(params)
                  let isError = params["isError"] ?? true
                  testCommunicate(result: result, isError: isError)
              }
              result(FlutterError(code: "SCAN_NFC", message: "Invalid format", details: nil))
          case "SCAN_NFC":
              if let params = call.arguments as? Dictionary<String, String> {
                  let pin1 = params["pin1"] ?? ""
                  let pin2 = params["pin2"] ?? ""
                  if (pin1.isEmpty && pin2.isEmpty) {
                      result(FlutterError(code: "SCAN_NFC", message: "Invalid format", details: nil))
                      return
                  }
                  self.scanner.setEnviroment(pin1input: pin1, pin2input: pin2, call: call, result: result)
                  self.scanner.scanRequest()
                  return
              }
              result(FlutterError(code: "SCAN_NFC", message: "Invalid format", details: nil))
          default:
              result(FlutterMethodNotImplemented)
          }
      })
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

private func testCommunicate(result: FlutterResult, isError: Bool) {
    if isError == true {
        result(FlutterError(code: "SCAN_NFC", message: "Message error", details: "Error detail"))
        return
    }
    result("This result from Swift")
}

import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
      let scanNFCChannel = FlutterMethodChannel(name: "scan_NFC",
                                                binaryMessenger: controller.binaryMessenger)
      scanNFCChannel.setMethodCallHandler({
        (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
          guard call.method == "getNFCUserInfo" else {
              result(FlutterMethodNotImplemented)
              return
            }
          scanNFC(result: result, isError: false)
      })
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

private func scanNFC(result: FlutterResult, isError: Bool) {
    if isError == true {
        result(FlutterError(code: "ERR_CODE_TEST", message: "Message error", details: "Error detail"))
        return
    }
    result("This result from Swift")
}

import UIKit
import Flutter
//import RaveSDK
import Alamofire

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    //var _result: FlutterResult!
    //var RAVEPAY_CHANNEL = "ng.i.handikraft/flutter_ravepay"
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?
        ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        //let controller = self.window.rootViewController
        //let channel = FlutterMethodChannel(name: RAVEPAY_CHANNEL, binaryMessenger: controller as! FlutterBinaryMessenger);
        
        //channel.setMethodCallHandler(handle)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
}


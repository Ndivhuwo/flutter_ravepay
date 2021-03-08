import Flutter
import UIKit
import RaveSDK

public class SwiftFlutterRavepayPlugin: NSObject, FlutterPlugin, RavePayProtocol {
    private var completionBlock: FlutterResult!
    
    public func tranasctionSuccessful(flwRef: String?, responseData: [String : Any]?) {
        print("tranasctionSuccessful: " + (flwRef ?? "default "))
        responseData?.forEach { print($0) }
        var myArgs = [String: Any]()
        myArgs["status"] = "SUCCESS";
        myArgs["payload"] = responseData
        completionBlock(myArgs)
    }
    
    public func tranasctionFailed(flwRef: String?, responseData: [String : Any]?) {
        print("tranasctionFailed: " + (flwRef ?? "default "))
        responseData?.forEach { print($0) }
        var myArgs = [String: Any]()
        myArgs["status"] = "ERROR";
        myArgs["payload"] = responseData
        completionBlock(myArgs)
    }
    
    
    public func onDismiss() {
        var myArgs = [String: Any]()
        myArgs["status"] = "ERROR";
        myArgs["payload"] = []
        completionBlock(myArgs)
    }

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "ng.i.handikraft/flutter_ravepay", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterRavepayPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    completionBlock = result
    let config = RaveConfig.sharedConfig()
    
    guard let args = call.arguments else {
      return
    }
    if let myArgs = args as? [String: Any],
       let amount = myArgs["amount"] as? String,
       let country = myArgs["country"] as? String,
        let email = myArgs["email"] as? String,
        let firstname = myArgs["firstname"] as? String,
        let lastname = myArgs["lastname"] as? String,
        let phonenumber = myArgs["phonenumber"] as? String,
        let narration = myArgs["narration"] as? String,
        let publicKey = myArgs["publicKey"] as? String,
        let encryptionKey = myArgs["encryptionKey"] as? String,
        let txRef = myArgs["txRef"] as? String,
        let isStaging = myArgs["isStaging"] as? Bool,
        let useSave = myArgs["useSave"] as? Bool,
       let currency = myArgs["currency"] as? String {
        
    
        config.country = country // Country Code
        config.currencyCode = currency // Currency
        config.email = email // Customer's email
        config.isStaging = isStaging // Toggle this for staging and live environment
        config.phoneNumber = phonenumber //Phone number
        config.transcationRef = txRef // transaction ref
        config.firstName = firstname
        config.lastName = lastname
        config.meta = [["metaname":"sdk", "metavalue":"ios"]]
        config.narration = narration
        config.publicKey = publicKey //Public key
        config.encryptionKey = encryptionKey //Encryption key

    
        let controller = NewRavePayViewController()
    
        let nav = UINavigationController(rootViewController: controller)
        controller.amount = amount
        controller.delegate = self
        UIApplication.shared.keyWindow?.rootViewController?.present(nav, animated: true)
    
    } else {
      result(FlutterError(code: "-1", message: "iOS could not extract " +
         "flutter arguments in method: (sendParams)", details: nil))
    }
    
  }
}

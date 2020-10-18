import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    // Google Maps API key added here
    GMSServices.provideAPIKey("AIzaSyDtM3okL5YRk_p3zQObSfPWgw53LnFjVpc")

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

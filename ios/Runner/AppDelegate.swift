import UIKit
import Flutter
import Firebase
import Foundation
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // TODO: Find a better solution with Google Secret Manager. For now the key have been restricted.
    GMSServices.provideAPIKey("AIzaSyCBDIS-gBNUOIsrjI2d5CWbivZCWWCjqOE")
    FirebaseApp.configure()
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

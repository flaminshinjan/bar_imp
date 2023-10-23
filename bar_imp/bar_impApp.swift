//
//  bar_impApp.swift
//  bar_imp
//
//  Created by Shinjan Patra on 23/10/23.
//
//
//  AppDelegate.swift
//  bar_imp
//
//  Created by Shinjan Patra on 23/10/23.
//
import UIKit
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Request user's permission to receive notifications
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            print("Permission granted: \(granted)")
        }

        // Register for remote notifications
        application.registerForRemoteNotifications()

        return true
    }

    // Handle registration for remote notifications
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
        let token = tokenParts.joined()
        print("Device Token: \(token)")
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register for remote notifications with error: \(error)")
    }

    // Handle incoming remote notifications
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        // You've received a silent notification, perform your background task here
        ViewModel().callAPI()

        completionHandler(.newData)
    }
    
    // Other app delegate methods here...
    // ...
}

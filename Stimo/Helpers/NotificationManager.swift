//
//  Extensions.swift
//  Stimo
//
//  Created by Ariel Waraney on 20/07/22.
//

import UserNotifications
import SwiftUI

class NotificationManager {
    
    static let instance = NotificationManager() // Singleton
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("ERROR : \(error)")
            } else {
                //print("SUCCESS")
            }
        }
    }
    
    func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Stimo"
        content.subtitle = "Congratulations, You Did It!"
        content.sound = .default
        content.badge = 1
        
        //time trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2.0, repeats: false)
        
        //request
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    func resetNotification() {
        //MARK: turn of the badge notification
        UIApplication.shared.applicationIconBadgeNumber = 0
        //MARK: Cancelling All Notification
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
}

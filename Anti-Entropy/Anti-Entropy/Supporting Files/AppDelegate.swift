//
//  AppDelegate.swift
//  Anti-Entropy
//
//  Created by Cirno MainasuK on 2018-4-16.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import UIKit
import CloudKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(ubiquitousKeyValueStoreDidChange(_:)),
                                               name: NSUbiquitousKeyValueStore.didChangeExternallyNotification,
                                               object: NSUbiquitousKeyValueStore.default)

        NSUbiquitousKeyValueStore.default.synchronize()
        
        return true
    }

}

extension AppDelegate {

    @objc func ubiquitousKeyValueStoreDidChange(_ notification: Notification) {
        guard let store = notification.object as? NSUbiquitousKeyValueStore else {
            return
        }

       store.synchronize()
    }

}

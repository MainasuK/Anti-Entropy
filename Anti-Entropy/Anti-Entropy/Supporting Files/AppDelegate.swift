//
//  AppDelegate.swift
//  Anti-Entropy
//
//  Created by Cirno MainasuK on 2018-4-16.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import UIKit
import CloudKit
import Localize_Swift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let availableLanguages = Localize.availableLanguages()
        let preferredLocalizations = Bundle.main.preferredLocalizations

        var toLocal: String?
        for local in preferredLocalizations where availableLanguages.contains(local) {
            toLocal = local
            break
        }

        Localize.setCurrentLanguage(toLocal ?? "en")
        
        return true
    }

}

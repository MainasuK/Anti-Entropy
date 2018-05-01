//
//  AppSettings.swift
//  Anti-Entropy
//
//  Created by Cirno MainasuK on 2018-4-28.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation
import RealmSwift
import RxRealm
import RxSwift
import RxSwiftExt
import Localize_Swift

struct AppSettings {
    
    static func setup() {
        AppSettings.setupLanguage()
        AppSettings.setupPresetTeamRealm()
        AppSettings.setupPresetTeamSettings()
    }

    private static func setupLanguage() {
        let availableLanguages = Localize.availableLanguages()
        let preferredLocalizations = Bundle.main.preferredLocalizations

        var toLocal: String?
        for local in preferredLocalizations where availableLanguages.contains(local) {
            toLocal = local
            break
        }

        Localize.setCurrentLanguage(toLocal ?? "en")
    }

    private static func setupPresetTeamRealm() {
        let realm = try! Realm()

        guard realm.objects(PresetTeam.self).count == 0 else {
            return
        }

        let presetTeam = PresetTeam.defaultTeam
        try! realm.write {
            realm.add(presetTeam)
        }
    }

    private static func setupPresetTeamSettings() {
        let realm = try! Realm()

        let presetTeams = realm.objects(PresetTeam.self)

        guard var setting = PresetTeamSetting.read() else {
            let id = presetTeams.first?.id ?? -1
            let setting = PresetTeamSetting(currentTeamID: id)
            setting.write()

            return
        }

        guard let _ = presetTeams.first(where: { $0.id == setting.currentTeamID }) else {
            setting.currentTeamID = presetTeams.first?.id ?? -1
            setting.write()
            return
        }
    }

}

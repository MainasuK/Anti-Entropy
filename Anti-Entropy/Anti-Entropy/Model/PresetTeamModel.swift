//
//  PresetTeamModel.swift
//  Anti-Entropy
//
//  Created by Cirno MainasuK on 2018-4-28.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation
import Schicksal
import RealmSwift
import RxRealm
import RxSwift
import RxSwiftExt
import Default

class PresetTeamModel {

    private let realm = try! Realm()

    let presetTeams: Observable<[PresetTeam]>
    var currentTeam: PresetTeam? {
        return realm.object(ofType: PresetTeam.self, forPrimaryKey: currentTeamID)
    }

    var currentTeamID: Int {
        get { return PresetTeamSetting.read()?.currentTeamID ?? -1 }
        set { PresetTeamSetting(currentTeamID: newValue).write() }
    }

    // MARK: - Singleton
    private static let instance = PresetTeamModel()

    private init() {
        let battleIntelligences = realm.objects(PresetTeam.self)
        presetTeams = Observable.array(from: battleIntelligences)
    }

    public static var shared: PresetTeamModel {
        return self.instance
    }

}

extension PresetTeamModel {

    static func clone(from team: PresetTeam) -> [Valkyrja] {
        return team.member.map { ValkyrjaModel.clone(from: $0) }
    }
    
}



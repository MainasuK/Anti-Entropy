//
//  PresetTeam.swift
//  Anti-Entropy
//
//  Created by Cirno MainasuK on 2018-4-22.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation
import Schicksal
import RealmSwift
import RxRealm

class PresetTeam: Object {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    let member = List<ValkyrjaIntelligence>()

    override static func primaryKey() -> String? {
        return "id"
    }
}

extension PresetTeam {
    static var defaultTeam: PresetTeam {
        let whiteComet      = defaultWhiteComet
        let valkyrieChariot = defaultValkyrieChariot
        let crimsonImpulse  = defaultCrimsonImpulse

        let presetTeam: PresetTeam = {
            let team = PresetTeam()
            team.member.removeAll()
            team.member.append(objectsIn: [whiteComet, valkyrieChariot, crimsonImpulse])
            return team
        }()

        return presetTeam
    }
}

extension PresetTeam {
    static var defaultWhiteComet: ValkyrjaIntelligence {
        let intelligence = ValkyrjaIntelligence()
        intelligence.valkyrjaCode = .whiteComet
        intelligence.weaponCode = .USP45
        return intelligence
    }

    static var defaultValkyrieChariot: ValkyrjaIntelligence {
        let intelligence = ValkyrjaIntelligence()
        intelligence.valkyrjaCode = .valkyrieChariot
        intelligence.weaponCode = .SeishuuMuramasa
        return intelligence
    }

    static var defaultCrimsonImpulse: ValkyrjaIntelligence {
        let intelligence = ValkyrjaIntelligence()
        intelligence.valkyrjaCode = .crimsonImpulse
        intelligence.weaponCode = .SU_22Howitzer
        return intelligence
    }

}

class ValkyrjaIntelligence: Object {
    @objc dynamic var valkyrjaCode: ValkyrjaCode = .whiteComet

    @objc dynamic var HP: HP   = 100
    @objc dynamic var SP: SP   = 100
    @objc dynamic var ATK: ATK = 100
    @objc dynamic var DEF: DEF = 100
    @objc dynamic var CRT: CRT = 100
    @objc dynamic var LV: LV   = 80

    @objc dynamic var rank: ValkyrjaRank = .SSS

    @objc dynamic var weaponCode: WeaponCode = .USP45
    @objc dynamic var weaponRarity: Rarity = .S1

    @objc dynamic var stigmataCode_T: StigmataCode = .none
    @objc dynamic var stigmataCode_C: StigmataCode = .none
    @objc dynamic var stigmataCode_B: StigmataCode = .none

    @objc dynamic var stigmataCode_T_Rarity: Rarity = .S1
    @objc dynamic var stigmataCode_C_Rarity: Rarity = .S1
    @objc dynamic var stigmataCode_B_Rarity: Rarity = .S1
}

extension ValkyrjaIntelligence {
    var basicStatus: BasicStatus {
        return BasicStatus(HP: HP, SP: SP, ATK: ATK, DEF: DEF, CRT: CRT, LV: LV)
    }
}

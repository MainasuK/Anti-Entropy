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
    let member = List<ValkyrjaIntelligence>()

    override static func primaryKey() -> String? {
        return "id"
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

    @objc dynamic var stigmataCode_T: StigmataCode = .none
    @objc dynamic var stigmataCode_C: StigmataCode = .none
    @objc dynamic var stigmataCode_B: StigmataCode = .none
}

extension ValkyrjaIntelligence {
    var basicStatus: BasicStatus {
        return BasicStatus(HP: HP, SP: SP, ATK: ATK, DEF: DEF, CRT: CRT, LV: LV)
    }
}

//
//  Valkyrja+BasicStatus.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-20.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public struct BasicStatus: Codable {
    public var HP: HP
    public var SP: SP
    public var ATK: ATK
    public var DEF: DEF
    public var CRT: CRT
    public var LV: LV

    public init() {
        self.HP  = 1782
        self.SP  = 151
        self.ATK = 297
        self.DEF = 166
        self.CRT = 35
        self.LV  = 80
    }

    public init(HP: HP, SP: SP, ATK: ATK, DEF: DEF, CRT: CRT, LV: LV) {
        self.HP  = HP
        self.SP  = SP
        self.ATK = ATK
        self.DEF = DEF
        self.CRT = CRT
        self.LV  = LV
    }
}

extension BasicStatus {

    public func DMG(for measurables: [Measurable], with trigger: DamageTrigger = [:], with buff: [Measurable] = []) -> DMG {
        // Melee Physical Base
        let mellPhysicalDamage = measurables.map { $0.meleePhysicalDamageTransform }.reduce(0, +) * Double(ATK)

        // Ranged Physical Base
        let rangedPhysicalDamage = measurables.map { $0.rangedPhysicalDamageTransform }.reduce(0, +) * Double(ATK)

        // Physical Plus
        let physicalDamagePlus = [measurables, buff].flatMap { $0 }.map { $0.physicalDamagePlus }.reduce(0, +)

        // Melee Ice
        // Ranged Ice
        // Melee Fire
        // Ranged Fire
        // Melee Lightning
        // Ranged Lightning

        let fireDamage = measurables.map { $0.fireDamagePlus }.reduce(0, +)

        let physicalDamage = mellPhysicalDamage + rangedPhysicalDamage + physicalDamagePlus

        return physicalDamage + fireDamage
    }

}


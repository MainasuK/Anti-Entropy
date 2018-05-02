//
//  V_CrimsonImpulse.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-27.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public struct V_CrimsonImpulse: Valkyrja {
    public let code: ValkyrjaCode  = .crimsonImpulse

    public let firstname: String   = "V_CrimsonImpulse_Firstname"
    public let lastname: String    = "V_CrimsonImpulse_Lastname"
    public let shortName: String   = "V_CrimsonImpulse_ShortName"
    public let fullName: String    = "V_CrimsonImpulse_FullName"
    public let description: String = "V_CrimsonImpulse_Description"

    public let localizeTableName: String? =  "Localizable_V_CrimsonImpulse"

    public let initialRank: ValkyrjaRank = .none
    public let weaponType: [WeaponType] = [.katana]

    public let skills: Skills = [SKS_CrimsonImpulse_SpecialAttack(),
                                 SKS_CrimsonImpulse_Ultimate(),
                                 SKS_CrimsonImpulse_BasicAttack(),
                                 SKS_CrimsonImpulse_Evasion(),
                                 SKS_CrimsonImpulse_PassiveSkill()]

    public var basicStatus: BasicStatus
    public var rank: ValkyrjaRank
    public var weapon: Weapon

    public init(basicStatus: BasicStatus = BasicStatus(),
                rank: ValkyrjaRank = .SSS,
                weapon: Weapon = SeishuuMuramasa()) {
        self.basicStatus = basicStatus
        self.rank = rank
        self.weapon = weapon
    }

}


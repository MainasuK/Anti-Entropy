//
//  V_ValkyrieChariot_SpecialAttack.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-26.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public struct SKS_ValkyrieChariot_SpecialAttack: Skill {
    public let type: SkillType = .specialAttack
    public let mainSkill: MainSkill = SK_ValkyrieChariot_GravityShatter()
    public let subSkills: SubSkills = [SK_ValkyrieChariot_AirSmash(),
                                       SK_ValkyrieChariot_HighGravity()]
}

// MARK: Gravity Shatter - Smash Ground
struct SK_ValkyrieChariot_GravityShatter_SmashGround: MainSubskill {
    let localizeTableName: String? = "Localizable_V_ValkyrieChariot"
    let caption: String = "SK_ValkyrieChariot_GravityShatter_SmashGround_Caption";
    let content: String = "SK_ValkyrieChariot_GravityShatter_SmashGround_Content";
    let attackTag: AttackTag = .switchIn
}

extension SK_ValkyrieChariot_GravityShatter_SmashGround {
    var meleePhysicalDamageTransform: Percentage { return 1.50 }
}

// MARK: Gravity Shatter
struct SK_ValkyrieChariot_GravityShatter: MainSkill {
    let localizeTableName: String? = "Localizable_V_ValkyrieChariot"
    let caption: String = "SK_ValkyrieChariot_GravityShatter_Caption";
    let content: String = "SK_ValkyrieChariot_GravityShatter_Content";
    let attackTag: AttackTag = .switchIn
    let mainSubskills: [MainSubskill] = [SK_ValkyrieChariot_GravityShatter_SmashGround()]
}

// MARK: Air Smash
struct SK_ValkyrieChariot_AirSmash: SubSkill {
    let localizeTableName: String? = "Localizable_V_ValkyrieChariot"
    let caption: String = "SK_ValkyrieChariot_AirSmash_Caption";
    let content: String = "SK_ValkyrieChariot_AirSmash_Content";
    let attackTag: AttackTag = .none
    let skillUnlockRank: SkillUnlockRank = .none
}

extension SK_ValkyrieChariot_AirSmash {
    var code: MeasurableCode { return .SK_ValkyrieChariot_AirSmash }
    func determine(_ determination: Determination) -> Addition {
        guard determination.attackable is SK_ValkyrieChariot_AirSmash,
        determination.abilityState.contains(.airborne) else {
            return [:]
        }

        return [.meleePhysicalDamageUP: 3.00 ]
    }
}

// MARK: High Gravity
struct SK_ValkyrieChariot_HighGravity: SubSkill {
    let localizeTableName: String? = "Localizable_V_ValkyrieChariot"
    let caption: String = "SK_ValkyrieChariot_HighGravity_Caption";
    let content: String = "SK_ValkyrieChariot_HighGravity_Content";
    let attackTag: AttackTag = .QTE
    let skillUnlockRank: SkillUnlockRank = .none
}

extension SK_ValkyrieChariot_HighGravity {
    var meleePhysicalDamageTransform: Percentage { return 1.0 }
    var code: MeasurableCode { return .SK_ValkyrieChariot_HighGravity }
    func determine(_ determination: Determination) -> Addition {
        guard determination.attackable is SK_ValkyrieChariot_HighGravity else { return [:] }
        return [.meleePhysicalDamagePlus: 4158.0]
    }
}

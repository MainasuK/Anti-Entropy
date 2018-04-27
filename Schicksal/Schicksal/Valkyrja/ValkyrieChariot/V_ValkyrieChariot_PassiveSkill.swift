//
//  V_ValkyrieChariot_PassiveSkill.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-27.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public struct SKS_ValkyrieChariot_PassiveSkill: Skill {
    public let type: SkillType = .passiveSkill
    public let mainSkill: MainSkill = SK_ValkyrieChariot_PassiveSkill()
    public let subSkills: SubSkills = [SK_ValkyrieChariot_AgravityWall(),
                                       SK_ValkyrieChariot_ParticleCharge()]
}

// Mark: - Passive Skill
struct SK_ValkyrieChariot_PassiveSkill: MainSkill {
    let localizeTableName: String? = "Localizable_V_ValkyrieChariot"
    let caption: String = "SK_ValkyrieChariot_PassiveSkill_Caption";
    let content: String = "SK_ValkyrieChariot_PassiveSkill_Content";
    let attackTag: AttackTag = .none
    let mainSubskills: [MainSubskill] = []
}

// MARK: - Agravity Wall
struct SK_ValkyrieChariot_AgravityWall: SubSkill {
    let localizeTableName: String? = "Localizable_V_ValkyrieChariot"
    let caption: String = "SK_ValkyrieChariot_AgravityWall_Caption";
    let content: String = "SK_ValkyrieChariot_AgravityWall_Content";
    let attackTag: AttackTag = .none
    let skillUnlockRank: SkillUnlockRank = .none
}

extension SK_ValkyrieChariot_AgravityWall {
    func determine(_ determination: Determination) -> Addition {
        guard determination.abilityState.contains(.stun) ||
        determination.abilityState.contains(.paralyze) else {
            return [:]
        }

        return [.physicalDamageUP: 1.0]
    }
}

// MARK: - Particle Charge
struct SK_ValkyrieChariot_ParticleCharge: SubSkill {
    let localizeTableName: String? = "Localizable_V_ValkyrieChariot"
    let caption: String = "SK_ValkyrieChariot_ParticleCharge_Caption";
    let content: String = "SK_ValkyrieChariot_ParticleCharge_Content";
    let attackTag: AttackTag = .none
    let skillUnlockRank: SkillUnlockRank = .S
}

extension SK_ValkyrieChariot_ParticleCharge {
    func determine(_ determination: Determination) -> Addition {
        guard let weapon = determination.attackable as? Weapon,
        weapon.type.isCannon else {
            return [:]
        }

        return [.criticalDamageUP: 1.0]
    }
}

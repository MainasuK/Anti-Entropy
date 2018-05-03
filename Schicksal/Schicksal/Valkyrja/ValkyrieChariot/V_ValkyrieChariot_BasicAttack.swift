//
//  V_ValkyrieChariot_BasicAttack.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-26.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public struct SKS_ValkyrieChariot_BasicAttack: Skill {
    public let type: SkillType = .basicAttack
    public let mainSkill: MainSkill = SK_ValkyrieChariot_ParticleCannon()
    public let subSkills: SubSkills = [SK_ValkyrieChariot_Reaction(),
                                       SK_ValkyrieChariot_AtomicRadiate(),
                                       SK_ValkyrieChariot_ChainReaction()]
}

// MARK: Particle Cannon - Arm Switch
struct SK_ValkyrieChariot_ParticleCannon_ArmSwitch: MainSubskill {
    let localizeTableName: String? = "Localizable_V_ValkyrieChariot"
    let caption: String = "SK_ValkyrieChariot_ParticleCannon_ArmSwitch_Caption";
    let content: String = "SK_ValkyrieChariot_ParticleCannon_ArmSwitch_Content";
    let attackTag: AttackTag = .charge
}

// MARK: Particle Cannon
struct SK_ValkyrieChariot_ParticleCannon: MainSkill {
    let localizeTableName: String? = "Localizable_V_ValkyrieChariot"
    let caption: String = "SK_ValkyrieChariot_ParticleCannon_Caption";
    let content: String = "SK_ValkyrieChariot_ParticleCannon_Content";
    let attackTag: AttackTag = .charge
    let mainSubskills: [MainSubskill] = [SK_ValkyrieChariot_ParticleCannon_ArmSwitch()]
}

// MARK: Reaction
struct SK_ValkyrieChariot_Reaction: SubSkill {
    let localizeTableName: String? = "Localizable_V_ValkyrieChariot"
    let caption: String = "SK_ValkyrieChariot_Reaction_Caption";
    let content: String = "SK_ValkyrieChariot_Reaction_Content";
    let attackTag: AttackTag = .none
    let skillUnlockRank: SkillUnlockRank = .none
}

// MARK: Atomic Radiate
struct SK_ValkyrieChariot_AtomicRadiate: SubSkill {
    let localizeTableName: String? = "Localizable_V_ValkyrieChariot"
    let caption: String = "SK_ValkyrieChariot_AtomicRadiate_Caption";
    let content: String = "SK_ValkyrieChariot_AtomicRadiate_Content";
    let attackTag: AttackTag = .none
    let skillUnlockRank: SkillUnlockRank = .none
}

// MARK: Chain Reaction
struct SK_ValkyrieChariot_ChainReaction: SubSkill {
    let localizeTableName: String? = "Localizable_V_ValkyrieChariot"
    let caption: String = "SK_ValkyrieChariot_ChainReaction_Caption";
    let content: String = "SK_ValkyrieChariot_ChainReaction_Content";
    let attackTag: AttackTag = .none
    let skillUnlockRank: SkillUnlockRank = .none
}

extension SK_ValkyrieChariot_ChainReaction {
    var code: MeasurableCode { return .SK_ValkyrieChariot_ChainReaction }
    func determine(_ determination: Determination) -> Addition {
        guard determination.abilityState.contains(.burn),
        determination.attackTag == .charge ||
        determination.attackTag == .normal ||
        determination.attackTag == .branch else {
            return [:]
        }

        return [.allDamageUP: 0.25]
    }
}

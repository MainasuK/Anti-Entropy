//
//  V_ValkyrieChariot_Evasion.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-27.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public struct SKS_ValkyrieChariot_Evasion: Skill {
    public let type: SkillType = .evasion
    public let mainSkill: MainSkill = SK_ValkyrieChariot_DimensionShift()
    public let subSkills: SubSkills = [SK_ValkyrieChariot_TimeLock(),
                                       SK_ValkyrieChariot_QuantumLock(),
                                       SK_ValkyrieChariot_ParticleRebuild()]
}


// MARK: - DimensionShift - TimeFracture
struct SK_ValkyrieChariot_DimensionShift_TimeFracture: MainSubskill {
    let localizeTableName: String? = "Localizable_V_ValkyrieChariot"
    let caption: String = "SK_ValkyrieChariot_DimensionShift_TimeFracture_Caption";
    let content: String = "SK_ValkyrieChariot_DimensionShift_TimeFracture_Content";
    let attackTag: AttackTag = .evade
}

// MARK: - DimensionShift
struct SK_ValkyrieChariot_DimensionShift: MainSkill {
    let localizeTableName: String? = "Localizable_V_ValkyrieChariot"
    let caption: String = "SK_ValkyrieChariot_DimensionShift_Caption";
    let content: String = "SK_ValkyrieChariot_DimensionShift_Content";
    let attackTag: AttackTag = .evade
    let mainSubskills: [MainSubskill] = [SK_WhiteComet_TimeShift_TimeFracture()]
}

// MARK: - Time Lock
struct SK_ValkyrieChariot_TimeLock: SubSkill {
    let localizeTableName: String? = "Localizable_V_ValkyrieChariot"
    let caption: String = "SK_ValkyrieChariot_TimeLock_Caption";
    let content: String = "SK_ValkyrieChariot_TimeLock_Content";
    let attackTag: AttackTag = .none
    let skillUnlockRank: SkillUnlockRank = .none
}

// MARK: - Quantum Lock
struct SK_ValkyrieChariot_QuantumLock: SubSkill {
    let localizeTableName: String? = "Localizable_V_ValkyrieChariot"
    let caption: String = "SK_ValkyrieChariot_QuantumLock_Caption";
    let content: String = "SK_ValkyrieChariot_QuantumLock_Content";
    let attackTag: AttackTag = .none
    let skillUnlockRank: SkillUnlockRank = .A
}

extension SK_ValkyrieChariot_QuantumLock {
    var code: MeasurableCode { return .SK_ValkyrieChariot_QuantumLock }
    func determine(_ determination: Determination) -> Addition {
        guard determination.abilityState == .witchTimeSlowed,
        let weapon = determination.attackable as? Weapon,
        type(of: weapon).type.isCannon || type(of: weapon).type.isMissiles else {
            return [:]
        }

        return [.physicalDamageUP: 0.25]
    }
}

// MARK: - Particle Rebuild
struct SK_ValkyrieChariot_ParticleRebuild: SubSkill {
    let localizeTableName: String? = "Localizable_V_ValkyrieChariot"
    let caption: String = "SK_ValkyrieChariot_ParticleRebuild_Caption";
    let content: String = "SK_ValkyrieChariot_ParticleRebuild_Content";
    let attackTag: AttackTag = .none
    let skillUnlockRank: SkillUnlockRank = .SS
}

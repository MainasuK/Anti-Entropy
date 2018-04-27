//
//  V_ CrimsonImpulse_SpecialAttack.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-27.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public struct SKS_CrimsonImpulse_SpecialAttack: Skill {
    public let type: SkillType = .specialAttack
    public let mainSkill: MainSkill = SK_CrimsonImpulse_SakuraRise()
    public let subSkills: SubSkills = [SK_CrimsonImpulse_LaidoWhirlwind(),
                                       SK_CrimsonImpulse_AirborneWhirlwind(),
                                       SK_CrimsonImpulse_DoubleWhirlwind()]
}

// MARK: - Sakura Rise - Whirling Slash
struct SK_CrimsonImpulse_SakuraRise_WhirlingSlash: MainSubskill {
    let localizeTableName: String? = "Localizable_V_CrimsonImpulse"
    let caption: String = "SK_CrimsonImpulse_SakuraRise_WhirlingSlash_Caption";
    let content: String = "SK_CrimsonImpulse_SakuraRise_WhirlingSlash_Content";
    let attackTag: AttackTag = .branch
}

extension SK_CrimsonImpulse_SakuraRise_WhirlingSlash {
    var meleePhysicalDamageTransform: Percentage { return 7 * 0.60 }
}

// MARK: - Sakura Rise
struct SK_CrimsonImpulse_SakuraRise: MainSkill {
    let localizeTableName: String? = "Localizable_V_CrimsonImpulse"
    let caption: String = "SK_CrimsonImpulse_SakuraRise_Caption";
    let content: String = "SK_CrimsonImpulse_SakuraRise_Content";
    let attackTag: AttackTag = .branch
    let mainSubskills: [MainSubskill] = [SK_CrimsonImpulse_SakuraRise_WhirlingSlash()]
}

// MARK: - Laido Whirlwind
struct SK_CrimsonImpulse_LaidoWhirlwind: SubSkill {
    let localizeTableName: String? = "Localizable_V_CrimsonImpulse"
    let caption: String = "SK_CrimsonImpulse_LaidoWhirlwind_Caption";
    let content: String = "SK_CrimsonImpulse_LaidoWhirlwind_Content";
    let attackTag: AttackTag = .QTE
    let skillUnlockRank: SkillUnlockRank = .none
}

extension SK_CrimsonImpulse_LaidoWhirlwind {
    var meleePhysicalDamageTransform: Percentage { return 2.250 + 4.0 }
}

// MAKR: - Airnorne Whirlwind
struct SK_CrimsonImpulse_AirborneWhirlwind: SubSkill {
    let localizeTableName: String? = "Localizable_V_CrimsonImpulse"
    let caption: String = "SK_CrimsonImpulse_AirborneWhirlwind_Caption";
    let content: String = "SK_CrimsonImpulse_AirborneWhirlwind_Content";
    let attackTag: AttackTag = .none
    let skillUnlockRank: SkillUnlockRank = .none
}

// MARK: - Double Whirlwind
struct SK_CrimsonImpulse_DoubleWhirlwind: SubSkill {
    let localizeTableName: String? = "Localizable_V_CrimsonImpulse"
    let caption: String = "SK_CrimsonImpulse_DoubleWhirlwind_Caption";
    let content: String = "SK_CrimsonImpulse_DoubleWhirlwind_Content";
    let attackTag: AttackTag = .branch
    let skillUnlockRank: SkillUnlockRank = .SS
}

extension SK_CrimsonImpulse_DoubleWhirlwind {
    var meleePhysicalDamageTransform: Percentage {
        return 1.0 * SK_CrimsonImpulse_LaidoWhirlwind().meleePhysicalDamageTransform
    }
}

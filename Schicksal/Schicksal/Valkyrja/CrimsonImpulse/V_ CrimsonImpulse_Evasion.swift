//
//  V_ CrimsonImpulse_Evasion.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-28.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public struct SKS_CrimsonImpulse_Evasion: Skill {
    public let type: SkillType = .evasion
    public let mainSkill: MainSkill = SK_CrimsonImpulse_PhantomBlade()
    public let subSkills: SubSkills = [SK_CrimsonImpulse_InstantDash(),
                                       SK_CrimsonImpulse_InnerShade(),
                                       SK_CrimsonImpulse_SharpCutter()]
}


// MARK: - Phantom Blade - Time Fracture
struct SK_CrimsonImpulse_PhantomBlade_TimeFracture: MainSubskill {
    let localizeTableName: String? = "Localizable_V_CrimsonImpulse"
    let caption: String = "SK_CrimsonImpulse_PhantomBlade_TimeFracture_Caption";
    let content: String = "SK_CrimsonImpulse_PhantomBlade_TimeFracture_Content";
    let attackTag: AttackTag = .evade
}

// MARK: - Phantom Blade
struct SK_CrimsonImpulse_PhantomBlade: MainSkill {
    let localizeTableName: String? = "Localizable_V_CrimsonImpulse"
    let caption: String = "SK_CrimsonImpulse_PhantomBlade_Caption";
    let content: String = "SK_CrimsonImpulse_PhantomBlade_Content";
    let attackTag: AttackTag = .evade
    let mainSubskills: [MainSubskill] = [SK_CrimsonImpulse_PhantomBlade_TimeFracture()]
}

// MARK: - Instant Dash
struct SK_CrimsonImpulse_InstantDash: SubSkill {
    let localizeTableName: String? = "Localizable_V_CrimsonImpulse"
    let caption: String = "SK_CrimsonImpulse_InstantDash_Caption";
    let content: String = "SK_CrimsonImpulse_InstantDash_Content";
    let attackTag: AttackTag = .normal
    let skillUnlockRank: SkillUnlockRank = .none
}

extension SK_CrimsonImpulse_InstantDash {
    var meleePhysicalDamageTransform: Percentage { return 1.0 }
    var code: MeasurableCode { return .SK_CrimsonImpulse_InstantDash }
    func determine(_ determination: Determination) -> Addition {
        guard determination.abilityState.contains(.witchTimeSlowed),
        determination.attackable is SK_CrimsonImpulse_InstantDash else {
                return [:]
        }

        return [.meleePhysicalDamageUP: 1.50]
    }
}

// MARK: - Inner Shade
struct SK_CrimsonImpulse_InnerShade: SubSkill {
    let localizeTableName: String? = "Localizable_V_CrimsonImpulse"
    let caption: String = "SK_CrimsonImpulse_InnerShade_Caption";
    let content: String = "SK_CrimsonImpulse_InnerShade_Content";
    let attackTag: AttackTag = .none
    let skillUnlockRank: SkillUnlockRank = .S
}

// MARK: - Sharp Cutter
struct SK_CrimsonImpulse_SharpCutter: SubSkill {
    let localizeTableName: String? = "Localizable_V_CrimsonImpulse"
    let caption: String = "SK_CrimsonImpulse_SharpCutter_Caption";
    let content: String = "SK_CrimsonImpulse_SharpCutter_Content";
    let attackTag: AttackTag = .none
    let skillUnlockRank: SkillUnlockRank = .S
}

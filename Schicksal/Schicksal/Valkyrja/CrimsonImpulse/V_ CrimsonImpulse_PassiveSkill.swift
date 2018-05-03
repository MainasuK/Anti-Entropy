//
//  V_ CrimsonImpulse_PassiveSkill.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-28.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public struct SKS_CrimsonImpulse_PassiveSkill: Skill {
    public let type: SkillType = .passiveSkill
    public let mainSkill: MainSkill = SK_CrimsonImpulse_PassiveSkill()
    public let subSkills: SubSkills = [SK_CrimsonImpulse_BladePuncture()]
}


// MARK: - Passive Skill
struct SK_CrimsonImpulse_PassiveSkill: MainSkill {
    let localizeTableName: String? = "Localizable_V_CrimsonImpulse"
    let caption: String = "SK_CrimsonImpulse_PassiveSkill_Caption";
    let content: String = "SK_CrimsonImpulse_PassiveSkill_Content";
    let attackTag: AttackTag = .none
    let mainSubskills: [MainSubskill] = []
}

// MARK: - Blade Puncture
struct SK_CrimsonImpulse_BladePuncture: SubSkill {
    let localizeTableName: String? = "Localizable_V_CrimsonImpulse"
    let caption: String = "SK_CrimsonImpulse_BladePuncture_Caption";
    let content: String = "SK_CrimsonImpulse_BladePuncture_Content";
    let attackTag: AttackTag = .none
    let skillUnlockRank: SkillUnlockRank = .none
}

extension SK_CrimsonImpulse_BladePuncture {
    var code: MeasurableCode { return .SK_CrimsonImpulse_BladePuncture }
    func determine(_ determination: Determination) -> Addition {
        guard !determination.abilityState.contains(.shielded) else {
            return [:]
        }

        return [.criticalRateUP: 0.20, .criticalDamageUP: 0.30]
    }
}

//
//  V_WhiteComet_PassiveSkill.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-18.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

struct SKS_WhiteComet_PassiveSkill: Skill {
    public let type: SkillType = .passiveSkill
    public let mainSkill: MainSkill = SK_WhiteComet_PassiveSkill()
    public let subSkills: SubSkills = [SK_WhiteComet_ShieldBreaker(),
                                       SK_WhiteComet_CriticalMastery()]
}

// MARK: - Passive Skill
struct SK_WhiteComet_PassiveSkill: MainSkill {
    let localizeTableName: String? = "Localizable_V_WhiteComet"
    let caption: String = "SK_WhiteComet_PassiveSkill_Caption"
    let content: String = "SK_WhiteComet_PassiveSkill_Content"
    let attackTag: AttackTag = .none
    let mainSubskills: [MainSubskill] = []
}

// MARK: - Shield Breaker
struct SK_WhiteComet_ShieldBreaker: SubSkill {
    let localizeTableName: String? = "Localizable_V_WhiteComet"
    let caption: String = "SK_WhiteComet_ShieldBreaker_Caption"
    let content: String = "SK_WhiteComet_ShieldBreaker_Content"
    let attackTag: AttackTag = .none
    let skillUnlockRank: SkillUnlockRank = .none
}

// MARK: - Critical Mastery
struct SK_WhiteComet_CriticalMastery: SubSkill {
    let localizeTableName: String? = "Localizable_V_WhiteComet"
    let caption: String = "SK_WhiteComet_CriticalMastery_Caption"
    let content: String = "SK_WhiteComet_CriticalMastery_Content"
    let attackTag: AttackTag = .none
    let skillUnlockRank: SkillUnlockRank = .SS
}

extension SK_WhiteComet_CriticalMastery {
    var passiveCriticalDamageUP: Percentage { return 0.40 }
}

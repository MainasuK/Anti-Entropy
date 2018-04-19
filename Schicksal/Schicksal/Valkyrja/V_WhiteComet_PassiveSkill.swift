//
//  V_WhiteComet_PassiveSkill.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-18.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public let SKS_WhiteComet_PassiveSkill: Skill = .passiveSkill(SK_WhiteComet_PassiveSkill(), [SK_WhiteComet_ShieldBreaker(),
                                                                                             SK_WhiteComet_CriticalMastery()])

// MARK: - Passive Skill
struct SK_WhiteComet_PassiveSkill_Explanation: Explanation {
    let caption_EN: String = "Passive Skill"
    let content_EN: String = """
        Character receives boost from passive skills automatically.
        """

    let caption_CN: String = ""
    let content_CN: String = ""

    let caption_JP: String = "パッシブ"
    let content_JP: String = """
        パッシブスキルは自動で発動される
        """
}

struct SK_WhiteComet_PassiveSkill: MainSkill {
    let explanation: Explanation = SK_WhiteComet_PassiveSkill_Explanation()
    let skillType: SkillType = .buff
    let mainSubskills: [MainSubskill] = []
}

// MARK: - Shield Breaker
struct SK_WhiteComet_ShieldBreaker_Explanation: Explanation {
    let caption_EN: String = "Shield Breaker"
    let content_EN: String = """
        Increases damage done to Shields by 50%
        """

    let caption_CN: String = ""
    let content_CN: String = ""

    let caption_JP: String = "彗星の盾崩し"
    let content_JP: String = """
        シールドへのダメージ+50%
        """
}

struct SK_WhiteComet_ShieldBreaker: SubSkill {
    let explanation: Explanation = SK_WhiteComet_ShieldBreaker_Explanation()
    let skillType: SkillType = .buff
    let skillUnlockRank: SkillUnlockRank = .none
}

// MARK: - Critical Mastery
struct SK_WhiteComet_CriticalMastery_Explanation: Explanation {
    let caption_EN: String = "Critical Mastery"
    let content_EN: String = """
        Increases Critical Damage by 40% when HP is ablove 80%
        """

    let caption_CN: String = ""
    let content_CN: String = ""

    let caption_JP: String = "彗星爆撃"
    let content_JP: String = """
        現在のHPが80%を超えている時、会心ダメージ+40%
        """
}

struct SK_WhiteComet_CriticalMastery: SubSkill {
    let explanation: Explanation = SK_WhiteComet_CriticalMastery_Explanation()
    let skillType: SkillType = .buff
    let skillUnlockRank: SkillUnlockRank = .SS
}

extension SK_WhiteComet_CriticalMastery {
    var passiveCriticalDamageUP: Percentage { return 0.40 }
}

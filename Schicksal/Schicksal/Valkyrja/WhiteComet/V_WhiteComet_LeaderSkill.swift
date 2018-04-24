//
//  V_WhiteComet_LeaderSkill.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-18.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

struct SKS_WhiteComet_LeaderSkill: Skill {
    public let type: SkillType = .leaderSkill
    public let mainSkill: MainSkill = SK_WhiteComet_MeteorBless()
    public let subSkills: SubSkills = [SK_WhiteComet_Guider()]
}

// MARK: - Meteor Bless - Guider
struct SK_WhiteComet_MeteorBless_Guider: MainSubskill {
    let localizeTableName: String? = "Localizable_V_WhiteComet"
    let caption: String = "SK_WhiteComet_MeteorBless_Guider_Caption"
    let content: String = "SK_WhiteComet_MeteorBless_Guider_Content"
    let attackTag: AttackTag = .none
}

extension SK_WhiteComet_MeteorBless_Guider {
    var passiveHPUP: Percentage { return 0.180 }
}

// MARK: - Meteor Bless
struct SK_WhiteComet_MeteorBless: MainSkill {
    let localizeTableName: String? = "Localizable_V_WhiteComet"
    let caption: String = "SK_WhiteComet_MeteorBless_Caption"
    let content: String = "SK_WhiteComet_MeteorBless_Content"
    let attackTag: AttackTag = .none
    let mainSubskills: [MainSubskill] = [SK_WhiteComet_MeteorBless_Guider()]
}

// MARK: - Guide
struct SK_WhiteComet_Guider: SubSkill {
    let localizeTableName: String? = "Localizable_V_WhiteComet"
    let caption: String = "SK_WhiteComet_Guide_Caption"
    let content: String = "SK_WhiteComet_Guide_Content"
    let attackTag: AttackTag = .none
    let skillUnlockRank: SkillUnlockRank = .A
}

extension SK_WhiteComet_Guider {
    var passiveHPUP: Percentage { return 0.080 }
}

//
//  V_WhiteComet_Evasion.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-18.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public struct SKS_WhiteComet_Evasion: Skill {
    public let type: SkillType = .evasion
    public let mainSkill: MainSkill = SK_WhiteComet_TimeShift()
    public let subSkills: SubSkills = [SK_WhiteComet_TimeBlink(),
                                       SK_WhiteComet_PowerFlow()]
}

// MARK: - Time Shift - Time Fracture
struct SK_WhiteComet_TimeShift_TimeFracture: MainSubskill {
    let localizeTableName: String? = "Localizable_V_WhiteComet"
    let caption: String = "SK_WhiteComet_TimeShift_TimeFracture_Caption"
    let content: String = "SK_WhiteComet_TimeShift_TimeFracture_Content"
    let attackTag: AttackTag = .none
}

// MARK: - Time Shift
struct SK_WhiteComet_TimeShift: MainSkill {
    let localizeTableName: String? = "Localizable_V_WhiteComet"
    let caption: String = "SK_WhiteComet_TimeShift_Caption"
    let content: String = "SK_WhiteComet_TimeShift_Content"
    let attackTag: AttackTag = .none
    let mainSubskills: [MainSubskill] = [SK_WhiteComet_TimeShift_TimeFracture()]
}

// MARK: - Time Blink
struct SK_WhiteComet_TimeBlink: SubSkill {
    let localizeTableName: String? = "Localizable_V_WhiteComet"
    let caption: String = "SK_WhiteComet_TimeBlink_Caption"
    let content: String = "SK_WhiteComet_TimeBlink_Caption"
    let attackTag: AttackTag = .none
    let skillUnlockRank: SkillUnlockRank = .A
}

// MARK: - Power Flow
struct SK_WhiteComet_PowerFlow: SubSkill {
    let localizeTableName: String? = "Localizable_V_WhiteComet"
    let caption: String = "SK_WhiteComet_PowerFlow_Caption"
    let content: String = "SK_WhiteComet_PowerFlow_Content"
    let attackTag: AttackTag = .none
    let skillUnlockRank: SkillUnlockRank = .none
}

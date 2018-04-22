//
//  V_WhiteComet_Evasion.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-18.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation


//public let SKS_WhiteComet_Evasion: Skill = .evasion(SK_WhiteComet_TimeShift(), [SK_WhiteComet_TimeBlink(),
//                                                                                SK_WhiteComet_PowerFlow()])

// MARK: - Time Shift - Time Fracture
struct SK_WhiteComet_TimeShift_TimeFracture_Explainable: Explainable {
    let caption_EN: String = "Time Fracture"
    let content_EN: String = """
        Triggers Time Fracture upon an Ultimate Evasion, slowing all enemies for 3 sec. Cooldown: 15 sec.
        """

    let caption_CN: String = ""
    let content_CN: String = ""

    let caption_JP: String = "時空断裂"
    let content_JP: String = """
        極限回避で全時空断裂発動、すべての敵の動き減速、継続時間3秒、クールタイム15秒
        """
}

struct SK_WhiteComet_TimeShift_TimeFracture: MainSubskill {
    let attackTag: AttackTag = .none
}

// MARK: - Time Shift
struct SK_WhiteComet_TimeShift_Explainable: Explainable {
    let caption_EN: String = "Time Shift"
    let content_EN: String = """
        Rolls quickly to evade enemy attacks.
        """

    let caption_CN: String = ""
    let content_CN: String = ""

    let caption_JP: String = "時空回避"
    let content_JP: String = """
        敵の攻撃を素早く回避する
        """
}

struct SK_WhiteComet_TimeShift: MainSkill {
    let attackTag: AttackTag = .none
    let mainSubskills: [MainSubskill] = [SK_WhiteComet_TimeShift_TimeFracture()]
}

// MARK: - Time Blink
struct SK_WhiteComet_TimeBlink_Explainable: Explainable {
    let caption_EN: String = "Time Blink"
    let content_EN: String = """
        Decreases cooldown of Time Fracture by 4 sec.
        """

    let caption_CN: String = ""
    let content_CN: String = ""

    let caption_JP: String = "時空の輝き"
    let content_JP: String = """
        時空断裂のクールタイム-4秒
        """
}

struct SK_WhiteComet_TimeBlink: SubSkill {
    let attackTag: AttackTag = .none
    let skillUnlockRank: SkillUnlockRank = .A
}

// MARK: - Power Flow
struct SK_WhiteComet_PowerFlow_Explainable: Explainable {
    let caption_EN: String = "Power Flow"
    let content_EN: String = """
        Recovers an additional 5 EP for the whole team when \
        Time Fracture is triggered by a successful evasion.
        """

    let caption_CN: String = ""
    let content_CN: String = ""

    let caption_JP: String = "パワーフロー"
    let content_JP: String = """
        回避で全時空断裂を発動時、チーム全員のEPを5回復する
        """
}

struct SK_WhiteComet_PowerFlow: SubSkill {
    let attackTag: AttackTag = .none
    let skillUnlockRank: SkillUnlockRank = .none
}

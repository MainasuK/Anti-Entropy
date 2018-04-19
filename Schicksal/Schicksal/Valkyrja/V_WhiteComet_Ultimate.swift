//
//  V_WhiteComet_Ultimate.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-17.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public let SKS_WhiteComet_Ultimate: Skill = .ultimate(SK_WhiteComet_ValkyrieBurst(), [SK_WhiteComet_ValkyrieImpact(),
                                                                                      SK_WhiteComet_ValkyrieBarrier(),
                                                                                      SK_WhiteComet_ValkyrieCharge()])

// MARK: - Valkyrie Burst - Burst
struct SK_WhiteComet_ValkyrieBurst_Burst_Explanation: Explanation {
    let caption_EN: String = "Burst"
    let content_EN: String = """
        Consumes SP continuously to increase own Attack Speed and Ignore Interrupt.
        """

    let caption_CN: String = ""
    let content_CN: String = ""

    let caption_JP: String = "爆発"
    let content_JP: String = """
        EPを継続的に消費し続け、自身の攻撃速度と中断耐性アップ
        """
}

struct SK_WhiteComet_ValkyrieBurst_Burst: MainSubskill {
    let skillType: SkillType = .buff
    let explanation: Explanation = SK_WhiteComet_ValkyrieBurst_Burst_Explanation()
}

// MARK: - Valkyrie Burst - Continuous Burst
struct SK_WhiteComet_ValkyrieBurst_ContinuousBurst_Explanation: Explanation {
    let caption_EN: String = "Continuous Burst"
    let content_EN: String = """
        Consumes 20 SP to activate and 10 SP per second until SP is depleted.
        """

    let caption_CN: String = ""
    let content_CN: String = ""

    let caption_JP: String = "継続爆発"
    let content_JP: String = """
        20EPで発動、EPがなくなるまで毎秒10EPを消費し続ける
        """
}

struct SK_WhiteComet_ValkyrieBurst_ContinuousBurst: MainSubskill {
    let skillType: SkillType = .buff
    let explanation: Explanation = SK_WhiteComet_ValkyrieBurst_ContinuousBurst_Explanation()
}

// MARK: - Valkyrie Burst
struct SK_WhiteComet_ValkyrieBurst_Explanation: Explanation {
    let caption_EN: String = "Valkyrie Burst"
    let content_EN: String = """
        Enters the goddess state using Valkyrie's energy burst.
        """

    let caption_CN: String = ""
    let content_CN: String = ""

    let caption_JP: String = "戦乙女の爆発"
    let content_JP: String = """
        戦乙女の力を開放し、神化状態になる
        """
}

struct SK_WhiteComet_ValkyrieBurst: MainSkill {
    let explanation: Explanation = SK_WhiteComet_ValkyrieBurst_Explanation()
    let skillType: SkillType = .buff
    let mainSubskills: [MainSubskill] = [SK_WhiteComet_ValkyrieBurst_Burst(), SK_WhiteComet_ValkyrieBurst_ContinuousBurst()]
}

// MARK: - Valkyrie Impact
struct SK_WhiteComet_ValkyrieImpact_Explanation: Explanation {
    let caption_EN: String = "Valkyrie Impact"
    let content_EN: String = """
        Stuns surrounding enemies for 5 sec when Burst occurs, dealing 2610 pysical damage.
        """

    let caption_CN: String = ""
    let content_CN: String = ""

    let caption_JP: String = "戦乙女衝撃"
    let content_JP: String = """
        爆発時、周囲の敵に2,610の物理ダメージを与え、スタン状態にする、継続時間5秒
        """
}

struct SK_WhiteComet_ValkyrieImpact: SubSkill {
    let explanation: Explanation = SK_WhiteComet_ValkyrieImpact_Explanation()
    let skillType: SkillType = .normal
    let skillUnlockRank: SkillUnlockRank = .none
}

extension SK_WhiteComet_ValkyrieImpact {
    var physicalDamagePlus: Increment { return 2610.0 }
}

// MARK: - Valkyrie Barrier
struct SK_WhiteComet_ValkyrieBarrier_Explanation: Explanation {
    let caption_EN: String = "Valkyrie Barrier"
    let content_EN: String = """
        Grants the whole team protection during Burst, increasing Ignore Interrupt and increasing DEF by 100%
        """

    let caption_CN: String = ""
    let content_CN: String = ""

    let caption_JP: String = "戦乙女の持久力"
    let content_JP: String = """
        爆発中チーム全員に守護効果を付与する。中断耐性がアップし、防御力+100%
        """
}

struct SK_WhiteComet_ValkyrieBarrier: SubSkill {
    let explanation: Explanation = SK_WhiteComet_ValkyrieBarrier_Explanation()
    let skillType: SkillType = .buff
    let skillUnlockRank: SkillUnlockRank = .S
}

// MARK: - Valkyrie Charge
struct SK_WhiteComet_ValkyrieCharge_Explanation: Explanation {
    let caption_EN: String = "Valkyrie Charge"
    let content_EN: String = """
        Receives an Energy Charge every 12.0 sec. The next attack stuns enemy for 3.0 sec.
        """

    let caption_CN: String = ""
    let content_CN: String = ""

    let caption_JP: String = "戦乙女チャージ"
    let content_JP: String = """
        12秒毎にチャージを1回し、次の攻撃で敵を3秒間スタン状態にする
        """
}

struct SK_WhiteComet_ValkyrieCharge: SubSkill {
    let explanation: Explanation = SK_WhiteComet_ValkyrieCharge_Explanation()
    let skillType: SkillType = .buff
    let skillUnlockRank: SkillUnlockRank = .none
}

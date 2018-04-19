//
//  V_WhiteComet_BasicAttack.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-17.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation


public let SKS_WhiteComet_BasicAttack: Skill = .basicAttack(SK_WhiteComet_MeteorTarget(), [SK_WhiteComet_MeteorShard(),
                                                                                           SK_WhiteComet_MeteorExplosion(),
                                                                                           SK_WhiteComet_MeteorImpact()])

// MARK: - Meteor Target - 1st Strike
struct SK_WhiteComet_MeteorTarget_1stStrike_Explanation: Explanation {
    let caption_EN: String = "1st Strike"
    let content_EN: String = """
        Deals physical damage equal to 100% of ATK
        """

    let caption_CN: String = ""
    let content_CN: String = ""

    let caption_JP: String = "1連"
    let content_JP: String = """
        攻撃力の100%物理ダメージを与える
        """
}

struct SK_WhiteComet_MeteorTarget_1stStrike: MainSubskill {
    let explanation: Explanation = SK_WhiteComet_MeteorTarget_1stStrike_Explanation()
    let skillType: SkillType = .normal
}

extension SK_WhiteComet_MeteorTarget_1stStrike {
    var physicalDamageTransform: Percentage { return 1.0 }
}

// MARK: - Meteor Target - 2nd Strike
struct SK_WhiteComet_MeteorTarget_2ndStrike_Explanation: Explanation {
    let caption_EN: String = "2nd Strike"
    let content_EN: String = """
        Deals physical damage equal to 100% of ATK
        """

    let caption_CN: String = ""
    let content_CN: String = ""

    let caption_JP: String = "2連"
    let content_JP: String = """
        攻撃力の100%物理ダメージを与える
        """
}

struct SK_WhiteComet_MeteorTarget_2ndStrike: MainSubskill {
    let explanation: Explanation = SK_WhiteComet_MeteorTarget_2ndStrike_Explanation()
    let skillType: SkillType = .normal
}

extension SK_WhiteComet_MeteorTarget_2ndStrike {
    var physicalDamageTransform: Percentage { return 1.0 }
}

// MARK: - Meteor Target - 3rd Strike
struct SK_WhiteComet_MeteorTarget_3rdStrike_Explanation: Explanation {
    let caption_EN: String = "3rd Strike"
    let content_EN: String = """
        Deals physical damage equal to 100% of ATK
        """

    let caption_CN: String = ""
    let content_CN: String = ""

    let caption_JP: String = "3連"
    let content_JP: String = """
        攻撃力の100%物理ダメージを与える
        """
}

struct SK_WhiteComet_MeteorTarget_3rdStrike: MainSubskill {
    let explanation: Explanation = SK_WhiteComet_MeteorTarget_3rdStrike_Explanation()
    let skillType: SkillType = .normal
}

extension SK_WhiteComet_MeteorTarget_3rdStrike {
    var physicalDamageTransform: Percentage { return 1.0 }
}

// MARK: - Meteor Target - 4th Strike
struct SK_WhiteComet_MeteorTarget_4thStrike_Explanation: Explanation {
    let caption_EN: String = "4th Strike"
    let content_EN: String = """
        Deals physical damage equal to 150% of ATK
        """

    let caption_CN: String = ""
    let content_CN: String = ""

    let caption_JP: String = "4連"
    let content_JP: String = """
        攻撃力の150%物理ダメージを与える
        """
}

struct SK_WhiteComet_MeteorTarget_4thStrike: MainSubskill {
    let explanation: Explanation = SK_WhiteComet_MeteorTarget_4thStrike_Explanation()
    let skillType: SkillType = .normal
}

extension SK_WhiteComet_MeteorTarget_4thStrike {
    var physicalDamageTransform: Percentage { return 1.50 }
}

// MARK: - Meteor Target - 5th Strike
struct SK_WhiteComet_MeteorTarget_5thStrike_Explanation: Explanation {
    let caption_EN: String = "5th Strike"
    let content_EN: String = """
        Deals physical damage equal to 250% of ATK
        """

    let caption_CN: String = ""
    let content_CN: String = ""

    let caption_JP: String = "5連"
    let content_JP: String = """
        攻撃力の250%物理ダメージを与える
        """
}

struct SK_WhiteComet_MeteorTarget_5thStrike: MainSubskill {
    let explanation: Explanation = SK_WhiteComet_MeteorTarget_5thStrike_Explanation()
    let skillType: SkillType = .normal
}

extension SK_WhiteComet_MeteorTarget_5thStrike {
    var physicalDamageTransform: Percentage { return 2.50 }
}

// MARK: - Meteor Target
struct SK_WhiteComet_MeteorTarget_Explanation: Explanation {
    let caption_EN: String = "Meteor Target"
    let content_EN: String = """
        Uses Gun Kata to unleash a penta-strike
        """

    let caption_CN: String = ""
    let content_CN: String = ""

    let caption_JP: String = "流星の的"
    let content_JP: String = """
        ガン＝カタで5連攻撃
        """
}

struct SK_WhiteComet_MeteorTarget: MainSkill {
    let explanation: Explanation = SK_WhiteComet_MeteorTarget_Explanation()
    let skillType: SkillType = .normal
    let mainSubskills: [MainSubskill] = [SK_WhiteComet_MeteorTarget_1stStrike(),
                                         SK_WhiteComet_MeteorTarget_2ndStrike(),
                                         SK_WhiteComet_MeteorTarget_3rdStrike(),
                                         SK_WhiteComet_MeteorTarget_4thStrike(),
                                         SK_WhiteComet_MeteorTarget_5thStrike()]
}

// MARK: - Meteor Shard
struct SK_WhiteComet_MeteorShard_Explanation: Explanation {
    let caption_EN: String = "Meteor Shard"
    let content_EN: String = """
        Increases physical damage of basic attacks by 143.
        """

    let caption_CN: String = ""
    let content_CN: String = ""

    let caption_JP: String = "流星の欠片"
    let content_JP: String = """
        通常攻撃命中時物理ダメージ+143
        """
}

struct SK_WhiteComet_MeteorShard: SubSkill {
    let explanation: Explanation = SK_WhiteComet_MeteorShard_Explanation()
    let skillType: SkillType = .buff
    let skillUnlockRank: SkillUnlockRank = .none
}

extension SK_WhiteComet_MeteorShard {
    var physicalDamagePlus: Increment { return 143.0 }
}

// MARK: - Meteor Explosion
struct SK_WhiteComet_MeteorExplosion_Explanation: Explanation {
    let caption_EN: String = "Meteor Explosion"
    let content_EN: String = """
        Deals an additional 1485 physical damage to enemy upon breaking its shield using basic or combo attacks.
        """

    let caption_CN: String = ""
    let content_CN: String = ""

    let caption_JP: String = "彗星爆破"
    let content_JP: String = """
        通常攻撃/分岐攻撃でシールドを破壊した時、敵に与える物理ダメージ+1,485
        """
}

struct SK_WhiteComet_MeteorExplosion: SubSkill {
    let explanation: Explanation = SK_WhiteComet_MeteorExplosion_Explanation()
    let skillType: SkillType = .normal
    let skillUnlockRank: SkillUnlockRank = .A
}

extension SK_WhiteComet_MeteorExplosion {
    var physicalDamagePlus: Increment { return 1485.0 }
}

// MARK: - Meteor Impact
struct SK_WhiteComet_MeteorImpact_Explanation: Explanation {
    let caption_EN: String = "Meteor Impact"
    let content_EN: String = """
        Basic attacks have a 40.0% chance of stunning enemy for 2 sec upon a successful interrupt.
        """

    let caption_CN: String = ""
    let content_CN: String = ""

    let caption_JP: String = "彗星ハートブレイク"
    let content_JP: String = """
        通常攻撃で中断成功時に40%の確率で敵をスタン状態にする、継続時間2秒
        """
}

struct SK_WhiteComet_MeteorImpact: SubSkill {
    let explanation: Explanation = SK_WhiteComet_MeteorImpact_Explanation()
    let skillType: SkillType = .debuff
    let skillUnlockRank: SkillUnlockRank = .SSS
}

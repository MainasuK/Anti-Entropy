//
//  V_WhiteComet_BasicAttack.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-17.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation


//public let SKS_WhiteComet_BasicAttack: Skill = .basicAttack(SK_WhiteComet_MeteorTarget(), [SK_WhiteComet_MeteorShard(),
//                                                                                           SK_WhiteComet_MeteorExplosion(),
//                                                                                           SK_WhiteComet_MeteorImpact()])

// MARK: - Meteor Target - 1st Strike
struct SK_WhiteComet_MeteorTarget_1stStrike_Explainable: Explainable {
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
    let skillType: DamageType = .normal
}

extension SK_WhiteComet_MeteorTarget_1stStrike {
    var meleePhysicalDamageTransform: Percentage { return 1.0 }
}

// MARK: - Meteor Target - 2nd Strike
struct SK_WhiteComet_MeteorTarget_2ndStrike_Explainable: Explainable {
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
    let skillType: DamageType = .normal
}

extension SK_WhiteComet_MeteorTarget_2ndStrike {
    var meleePhysicalDamageTransform: Percentage { return 0.50 }
    var rangedPhysicalDamageTransform: Percentage { return 0.50}
}

// MARK: - Meteor Target - 3rd Strike
struct SK_WhiteComet_MeteorTarget_3rdStrike_Explainable: Explainable {
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
    let skillType: DamageType = .normal
}

extension SK_WhiteComet_MeteorTarget_3rdStrike {
    var meleePhysicalDamageTransform: Percentage { return 0.50 }
    var rangedPhysicalDamageTransform: Percentage { return 0.50 }
}

// MARK: - Meteor Target - 4th Strike
struct SK_WhiteComet_MeteorTarget_4thStrike_Explainable: Explainable {
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
    let skillType: DamageType = .normal
}

extension SK_WhiteComet_MeteorTarget_4thStrike {
    var meleePhysicalDamageTransform: Percentage { return 1.50 }
}

// MARK: - Meteor Target - 5th Strike
struct SK_WhiteComet_MeteorTarget_5thStrike_Explainable: Explainable {
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
    let skillType: DamageType = .normal
}

extension SK_WhiteComet_MeteorTarget_5thStrike {
    var meleePhysicalDamageTransform: Percentage { return 2.50 }
}

// MARK: - Meteor Target
struct SK_WhiteComet_MeteorTarget_Explainable: Explainable {
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
    let skillType: DamageType = .normal
//    let mainSubskills: [MainSubskill] = [SK_WhiteComet_MeteorTarget_1stStrike(),
//                                         SK_WhiteComet_MeteorTarget_2ndStrike(),
//                                         SK_WhiteComet_MeteorTarget_3rdStrike(),
//                                         SK_WhiteComet_MeteorTarget_4thStrike(),
//                                         SK_WhiteComet_MeteorTarget_5thStrike()]
}

// MARK: - Meteor Shard
struct SK_WhiteComet_MeteorShard_Explainable: Explainable {
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
    let skillType: DamageType = .buff
    let skillUnlockRank: SkillUnlockRank = .none
}

extension SK_WhiteComet_MeteorShard {
    var physicalDamagePlus: Increment { return 143.0 }
}

// MARK: - Meteor Explosion
struct SK_WhiteComet_MeteorExplosion_Explainable: Explainable {
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
    let skillType: DamageType = .normal
    let skillUnlockRank: SkillUnlockRank = .A
}

extension SK_WhiteComet_MeteorExplosion {
    var physicalDamagePlus: Increment { return 1485.0 }
}

// MARK: - Meteor Impact
struct SK_WhiteComet_MeteorImpact_Explainable: Explainable {
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
    let skillType: DamageType = .debuff
    let skillUnlockRank: SkillUnlockRank = .SSS
}

//
//  V_WhiteComet_SpecialAttack.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-17.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

//public let SKS_WhiteComet_SpecialAttack: Skill = .specialAttack(SK_WhiteComet_CometFall(), [SK_WhiteComet_CometExplosion(),
//                                                                                            SK_WhiteComet_TopHelix(),
//                                                                                            SK_WhiteComet_GravityFreak()])

// MARK: - Comet Fall - Punt
struct SK_WhiteComet_CometFall_Punt_Explainable: Explainable {
    let caption_EN: String = "Punt"
    let content_EN: String = """
        Deals physical damage equal to 50% of ATK.
        """

    let caption_CN: String = ""
    let content_CN: String = ""

    let caption_JP: String = "蹴り上げ"
    let content_JP: String = """
        攻撃力の50%物理ダメージ
        """
}

struct SK_WhiteComet_CometFall_Punt: MainSubskill {
    let skillType: DamageType = .comboSkill
}

extension SK_WhiteComet_CometFall_Punt {
    var meleePhysicalDamageTransform: Percentage { return 0.50 }
}

// MARK: - Comet Fall - Bring Down
struct SK_WhiteComet_CometFall_BringDown_Explainable: Explainable {
    let caption_EN: String = "Bring Down"
    let content_EN: String = """
        Deals AOE physical damage equal to 275% of ATK.
        """

    let caption_CN: String = ""
    let content_CN: String = ""

    let caption_JP: String = "落とす"
    let content_JP: String = """
        攻撃力の275%範囲物理ダメージ
        """
}

struct SK_WhiteComet_CometFall_BringDown: MainSubskill {
    let skillType: DamageType = .comboSkill
}

extension SK_WhiteComet_CometFall_BringDown {
    var meleePhysicalDamageTransform: Percentage { return 2.750 }
}

// MARK: - Comet Fall
struct SK_WhiteComet_CometFall_Explainable: Explainable {
    let caption_EN: String = "Comet Fall"
    let content_EN: String = """
        Attacks enemy with a double-kick, punting it into the air and then bringing it down.
        """

    let caption_CN: String = ""
    let content_CN: String = ""

    let caption_JP: String = "彗星降下"
    let content_JP: String = """
        2連蹴りの後敵を宙に蹴り上げて落とす
        """
}

struct SK_WhiteComet_CometFall: MainSkill {
    let skillType: DamageType = .comboSkill
//    let mainSubskills: [MainSubskill] = [SK_WhiteComet_CometFall_Punt(), SK_WhiteComet_CometFall_BringDown()]
}

// MARK: - Comet Explosion
struct SK_WhiteComet_CometExplosion_Explainable: Explainable {
    let caption_EN: String = "Coment Explosion"
    let content_EN: String = """
        Unleashes a crushing attack upon entering the battle, dealing (275% of ATK) physical damage. \
        stuns enemy for 6.0 sec upon a successful interrupt.
        """

    let caption_CN: String = ""
    let content_CN: String = ""

    let caption_JP: String = "彗星炸裂"
    let content_JP: String = """
        出場時に打ち落として攻撃力の275%物理ダメージを与え、敵を中断時にスタン状態にする、継続時間6秒
        """
}

struct SK_WhiteComet_CometExplosion: SubSkill {
    let skillType: DamageType = .switchSkill
    let skillUnlockRank: SkillUnlockRank = .none
}

extension SK_WhiteComet_CometExplosion {
    var meleePhysicalDamageTransform: Percentage { return 2.75 }
}

// MARK: - Top Helix
struct SK_WhiteComet_TopHelix_Explainable: Explainable {
    let caption_EN: String = "Top Helix"
    let content_EN: String = """
        Triggers QTE and enters the battle when enemy is lifted in the air, dealing (375% of ATK+2250) \
        physical damage.
        """

    let caption_CN: String = ""
    let content_CN: String = ""

    let caption_JP: String = "浮遊螺旋"
    let content_JP: String = """
        敵が浮遊状態の時に出撃すると発動する。攻撃力の375%+2,250の物理ダメージを与え、最後の一撃で敵をスタン状態にする、継続時間3秒
        """
}

struct SK_WhiteComet_TopHelix: SubSkill {
    let skillType: DamageType = .QTE
    let skillUnlockRank: SkillUnlockRank = .none
}

extension SK_WhiteComet_TopHelix {
    var meleePhysicalDamageTransform: Percentage { return 3.75 }
    var physicalDamagePlus: Increment { return 2250.0 }
}

// MARK: - Gravity Freak
struct SK_WhiteComet_GravityFreak_Explainable: Explainable {
    let caption_EN: String = "Gravity Freak"
    let content_EN: String = """
        The second strike of combo attacks and Comet Explosion deals an additional 1125 fire damage \
        to enemy with an unbroken Elite Shield.
        """

    let caption_CN: String = ""
    let content_CN: String = ""

    let caption_JP: String = "重力の異想"
    let content_JP: String = """
        エリートシールドが破壊されていない敵に分岐攻撃の2発目と彗星炸裂を使用すると、さらに1,125の炎ダメージを与える
        """
}

struct SK_WhiteComet_GravityFreak: SubSkill {
    let skillType: DamageType = .normal
    let skillUnlockRank: SkillUnlockRank = .S
}

extension SK_WhiteComet_GravityFreak {
    var fireDamagePlus: Increment { return 1125.0 }
}

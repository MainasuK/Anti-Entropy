//
//  V_WhiteComet_SpecialAttack.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-17.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

struct SKS_WhiteComet_SpecialAttack: Skill {
    public let type: SkillType = .specialAttack
    public let mainSkill: MainSkill = SK_WhiteComet_CometFall()
    public let subSkills: SubSkills = [SK_WhiteComet_CometExplosion(),
                                       SK_WhiteComet_TopHelix(),
                                       SK_WhiteComet_GravityFreak()]
}

// MARK: - Comet Fall - Punt
struct SK_WhiteComet_CometFall_Punt: MainSubskill {
    let localizeTableName: String? = "Localizable_V_WhiteComet"
    let caption: String = "SK_WhiteComet_CometFall_Punt_Caption";
    let content: String = "SK_WhiteComet_CometFall_Punt_Content";
    let attackTag: AttackTag = .branch
}

extension SK_WhiteComet_CometFall_Punt {
    var meleePhysicalDamageTransform: Percentage { return 0.50 }
}

// MARK: - Comet Fall - Bring Down
struct SK_WhiteComet_CometFall_BringDown: MainSubskill {
    let localizeTableName: String? = "Localizable_V_WhiteComet"
    let caption: String = "SK_WhiteComet_CometFall_BringDown_Caption";
    let content: String = "SK_WhiteComet_CometFall_BringDown_Content";
    let attackTag: AttackTag = .branch
}

extension SK_WhiteComet_CometFall_BringDown {
    var meleePhysicalDamageTransform: Percentage { return 2.750 }
}

// MARK: - Comet Fall
struct SK_WhiteComet_CometFall: MainSkill {
    let localizeTableName: String? = "Localizable_V_WhiteComet"
    let caption: String = "SK_WhiteComet_CometFall_Caption";
    let content: String = "SK_WhiteComet_CometFall_Content";
    let attackTag: AttackTag = .branch
    let mainSubskills: [MainSubskill] = [SK_WhiteComet_CometFall_Punt(), SK_WhiteComet_CometFall_BringDown()]
}

// MARK: - Comet Explosion
struct SK_WhiteComet_CometExplosion: SubSkill {
    let localizeTableName: String? = "Localizable_V_WhiteComet"
    let caption: String = "SK_WhiteComet_CometExplosion_Caption";
    let content: String = "SK_WhiteComet_CometExplosion_Content";
    let attackTag: AttackTag = .switchIn
    let skillUnlockRank: SkillUnlockRank = .none
}

extension SK_WhiteComet_CometExplosion {
    var meleePhysicalDamageTransform: Percentage { return 2.75 }
}

// MARK: - Top Helix
struct SK_WhiteComet_TopHelix: SubSkill {
    let localizeTableName: String? = "Localizable_V_WhiteComet"
    let caption: String = "SK_WhiteComet_TopHelix_Caption";
    let content: String = "SK_WhiteComet_TopHelix_Content";
    let attackTag: AttackTag = .QTE
    let skillUnlockRank: SkillUnlockRank = .none
}

extension SK_WhiteComet_TopHelix {
    var meleePhysicalDamageTransform: Percentage { return 3.75 }
    var physicalDamagePlus: Increment { return 2250.0 }
}

// MARK: - Gravity Freak
struct SK_WhiteComet_GravityFreak: SubSkill {
    let localizeTableName: String? = "Localizable_V_WhiteComet"
    let caption: String = "SK_WhiteComet_GravityFreak_Caption";
    let content: String = "SK_WhiteComet_GravityFreak_Content";
    let attackTag: AttackTag = .normal
    let skillUnlockRank: SkillUnlockRank = .S
}

extension SK_WhiteComet_GravityFreak {
    var fireDamagePlus: Increment { return 1125.0 }
}

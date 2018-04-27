//
//  V_ CrimsonImpulse_BasicAttack.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-27.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public struct SKS_CrimsonImpulse_BasicAttack: Skill {
    public let type: SkillType = .basicAttack
    public let mainSkill: MainSkill = SK_CrimsonImpulse_Gotamashiki()
    public let subSkills: SubSkills = [SK_CrimsonImpulse_RelentlessSlash(),
                                       SK_CrimsonImpulse_BloodSakura(),
                                       SK_CrimsonImpulse_NightSakura()]
}


struct SK_CrimsonImpulse_Gotamashiki_1stStrike: MainSubskill {
    let localizeTableName: String? = "Localizable_V_CrimsonImpulse"
    let caption: String = "SK_CrimsonImpulse_Gotamashiki_1stStrike_Caption";
    let content: String = "SK_CrimsonImpulse_Gotamashiki_1stStrike_Content";
    let attackTag: AttackTag = .normal
}

extension SK_CrimsonImpulse_Gotamashiki_1stStrike {
    var meleePhysicalDamageTransform: Percentage { return 1.0 }
}

struct SK_CrimsonImpulse_Gotamashiki_2ndStrike: MainSubskill {
    let localizeTableName: String? = "Localizable_V_CrimsonImpulse"
    let caption: String = "SK_CrimsonImpulse_Gotamashiki_2ndStrike_Caption";
    let content: String = "SK_CrimsonImpulse_Gotamashiki_2ndStrike_Content";
    let attackTag: AttackTag = .normal
}

extension SK_CrimsonImpulse_Gotamashiki_2ndStrike {
    var meleePhysicalDamageTransform: Percentage { return 1.20 }
}

struct SK_CrimsonImpulse_Gotamashiki_3rdStrike: MainSubskill {
    let localizeTableName: String? = "Localizable_V_CrimsonImpulse"
    let caption: String = "SK_CrimsonImpulse_Gotamashiki_3rdStrike_Caption";
    let content: String = "SK_CrimsonImpulse_Gotamashiki_3rdStrike_Content";
    let attackTag: AttackTag = .normal
}

extension SK_CrimsonImpulse_Gotamashiki_3rdStrike {
    var meleePhysicalDamageTransform: Percentage { return 0.750 }
}

struct SK_CrimsonImpulse_Gotamashiki_4thStrike: MainSubskill {
    let localizeTableName: String? = "Localizable_V_CrimsonImpulse"
    let caption: String = "SK_CrimsonImpulse_Gotamashiki_4thStrike_Caption";
    let content: String = "SK_CrimsonImpulse_Gotamashiki_4thStrike_Content";
    let attackTag: AttackTag = .normal
}

extension SK_CrimsonImpulse_Gotamashiki_4thStrike {
    var meleePhysicalDamageTransform: Percentage { return 0.80 }
}

struct SK_CrimsonImpulse_Gotamashiki_5thStrike: MainSubskill {
    let localizeTableName: String? = "Localizable_V_CrimsonImpulse"
    let caption: String = "SK_CrimsonImpulse_Gotamashiki_5thStrike_Caption";
    let content: String = "SK_CrimsonImpulse_Gotamashiki_5thStrike_Content";
    let attackTag: AttackTag = .normal
}

extension SK_CrimsonImpulse_Gotamashiki_5thStrike {
    var meleePhysicalDamageTransform: Percentage { return 2.50 }
}

struct SK_CrimsonImpulse_Gotamashiki: MainSkill {
    let localizeTableName: String? = "Localizable_V_CrimsonImpulse"
    let caption: String = "SK_CrimsonImpulse_Gotamashiki_Caption";
    let content: String = "SK_CrimsonImpulse_Gotamashiki_Content";
    let attackTag: AttackTag = .normal
    let mainSubskills: [MainSubskill] = [SK_CrimsonImpulse_Gotamashiki_1stStrike(),
                                         SK_CrimsonImpulse_Gotamashiki_2ndStrike(),
                                         SK_CrimsonImpulse_Gotamashiki_3rdStrike(),
                                         SK_CrimsonImpulse_Gotamashiki_4thStrike(),
                                         SK_CrimsonImpulse_Gotamashiki_5thStrike()]
}

struct SK_CrimsonImpulse_RelentlessSlash: SubSkill {
    let localizeTableName: String? = "Localizable_V_CrimsonImpulse"
    let caption: String = "SK_CrimsonImpulse_RelentlessSlash_Caption";
    let content: String = "SK_CrimsonImpulse_RelentlessSlash_Content";
    let attackTag: AttackTag = .none
    let skillUnlockRank: SkillUnlockRank = .none
}

struct SK_CrimsonImpulse_BloodSakura: SubSkill {
    let localizeTableName: String? = "Localizable_V_CrimsonImpulse"
    let caption: String = "SK_CrimsonImpulse_RelentlessSlash_Caption";
    let content: String = "SK_CrimsonImpulse_RelentlessSlash_Content";
    let attackTag: AttackTag = .none
    let skillUnlockRank: SkillUnlockRank = .A
}

struct SK_CrimsonImpulse_NightSakura: SubSkill {
    let localizeTableName: String? = "Localizable_V_CrimsonImpulse"
    let caption: String = "SK_CrimsonImpulse_NightSakura_Caption";
    let content: String = "SK_CrimsonImpulse_NightSakura_Content";
    let attackTag: AttackTag = .none
    let skillUnlockRank: SkillUnlockRank = .SSS
}

extension SK_CrimsonImpulse_NightSakura {
    func determine(_ determination: Determination) -> Addition {
        guard determination.attackTag == .branch else {
            return [:]
        }

        return [.meleePhysicalDamageUP: 0.20]
    }
}

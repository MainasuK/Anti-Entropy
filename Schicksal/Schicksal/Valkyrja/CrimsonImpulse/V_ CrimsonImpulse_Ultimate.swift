//
//  V_ CrimsonImpulse_Ultimate.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-27.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public struct SKS_CrimsonImpulse_Ultimate: Skill {
    public let type: SkillType = .ultimate
    public let mainSkill: MainSkill = SK_CrimsonImpulse_Amaterasu()
    public let subSkills: SubSkills = [SK_CrimsonImpulse_SoulPower(),
                                       SK_CrimsonImpulse_SpiritBlade(),
                                       SK_CrimsonImpulse_SakuraNoHaku()]
}

// MARK: - Amaterasu - Amaterasu
struct SK_CrimsonImpulse_Amaterasu_Amaterasu: MainSubskill {
    let localizeTableName: String? = "Localizable_V_CrimsonImpulse"
    let caption: String = "SK_CrimsonImpulse_Amaterasu_Amaterasu_Caption";
    let content: String = "SK_CrimsonImpulse_Amaterasu_Amaterasu_Content";
    let attackTag: AttackTag = .ultra
}

extension SK_CrimsonImpulse_Amaterasu_Amaterasu {
    var meleePhysicalDamageTransform: Percentage { return 11.50 }
}

// MARK: - Amaterasu
struct SK_CrimsonImpulse_Amaterasu: MainSkill {
    let localizeTableName: String? = "Localizable_V_CrimsonImpulse"
    let caption: String = "SK_CrimsonImpulse_Amaterasu_Caption";
    let content: String = "SK_CrimsonImpulse_Amaterasu_Content";
    let attackTag: AttackTag = .ultra
    let mainSubskills: [MainSubskill] = [SK_CrimsonImpulse_Amaterasu_Amaterasu()]
}

// MARK: - Soul Power
struct SK_CrimsonImpulse_SoulPower: SubSkill {
    let localizeTableName: String? = "Localizable_V_CrimsonImpulse"
    let caption: String = "SK_CrimsonImpulse_SoulPower_Caption";
    let content: String = "SK_CrimsonImpulse_SoulPower_Content";
    let attackTag: AttackTag = .none
    let skillUnlockRank: SkillUnlockRank = .none
}

extension SK_CrimsonImpulse_SoulPower {
    var code: MeasurableCode { return .SK_CrimsonImpulse_SoulPower }
    func determine(_ determination: Determination) -> Addition {
        guard determination.attackable is SK_CrimsonImpulse_Amaterasu_Amaterasu else {
            return [:]
        }

        return [.fireDamageAffix: 79.0 * 17]
    }
}

// MARK: - Spirit Blade
struct SK_CrimsonImpulse_SpiritBlade: SubSkill {
    let localizeTableName: String? = "Localizable_V_CrimsonImpulse"
    let caption: String = "SK_CrimsonImpulse_SpiritBlade_Caption";
    let content: String = "SK_CrimsonImpulse_SpiritBlade_Content";
    let attackTag: AttackTag = .none
    let skillUnlockRank: SkillUnlockRank = .SS
}

// MARK: - Sakura no Haku
struct SK_CrimsonImpulse_SakuraNoHaku: SubSkill {
    let localizeTableName: String? = "Localizable_V_CrimsonImpulse"
    let caption: String = "SK_CrimsonImpulse_SakuraNoHaku_Caption";
    let content: String = "SK_CrimsonImpulse_SakuraNoHaku_Content";
    let attackTag: AttackTag = .none
    let skillUnlockRank: SkillUnlockRank = .SSS
}

extension SK_CrimsonImpulse_SakuraNoHaku {
    var code: MeasurableCode { return .SK_CrimsonImpulse_SakuraNoHaku }
    func determine(_ determination: Determination) -> Addition {
        guard determination.abilityState.contains(.utilityState) else {
            return [:]
        }

        return [.meleePhysicalDamageUP: 0.20]
    }
}

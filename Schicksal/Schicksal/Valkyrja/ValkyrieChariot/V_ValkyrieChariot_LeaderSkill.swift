//
//  V_ValkyrieChariot_LeaderSkill.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-27.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public struct SKS_ValkyrieChariot_LeaderSkill: Skill {
    public let type: SkillType = .leaderSkill
    public let mainSkill: MainSkill = SK_ValkyrieChariot_RiotArmor()
    public let subSkills: SubSkills = [SK_ValkyrieChariot_RiotArmor2()]
}

// MARK: - Riot Armor - Riot Armor
struct SK_ValkyrieChariot_RiotArmor_RiotArmor: MainSubskill {
    let localizeTableName: String? = "Localizable_V_ValkyrieChariot"
    let caption: String = "SK_ValkyrieChariot_RiotArmor_RiotArmor_Caption";
    let content: String = "SK_ValkyrieChariot_RiotArmor_RiotArmor_Content";
    let attackTag: AttackTag = .leader
}

extension SK_ValkyrieChariot_RiotArmor_RiotArmor {
    var scope: Scope { return .all }
    var code: MeasurableCode { return .SK_ValkyrieChariot_RiotArmor_RiotArmor }
}

// MARK: - Riot Armor
struct SK_ValkyrieChariot_RiotArmor: MainSkill {
    let localizeTableName: String? = "Localizable_V_ValkyrieChariot"
    let caption: String = "SK_ValkyrieChariot_RiotArmor_Caption";
    let content: String = "SK_ValkyrieChariot_RiotArmor_Content";
    let attackTag: AttackTag = .leader
    let mainSubskills: [MainSubskill] = [SK_ValkyrieChariot_RiotArmor_RiotArmor()]
}

extension SK_ValkyrieChariot_RiotArmor {
    var scope: Scope { return .all }
    var code: MeasurableCode { return .SK_ValkyrieChariot_RiotArmor }
}

// MARK: - Riot Armor (2)
struct SK_ValkyrieChariot_RiotArmor2: SubSkill {
    let localizeTableName: String? = "Localizable_V_ValkyrieChariot"
    let caption: String = "SK_ValkyrieChariot_RiotArmor2_Caption";
    let content: String = "SK_ValkyrieChariot_RiotArmor2_Content";
    let attackTag: AttackTag = .leader
    let skillUnlockRank: SkillUnlockRank = .A
}

extension SK_ValkyrieChariot_RiotArmor2 {
    var scope: Scope { return .all }
    var code: MeasurableCode { return .SK_ValkyrieChariot_RiotArmor2 }
}

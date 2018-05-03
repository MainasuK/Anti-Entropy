//
//  V_WhiteComet_BasicAttack.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-17.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public struct SKS_WhiteComet_BasicAttack: Skill {
    public let type: SkillType = .basicAttack
    public let mainSkill: MainSkill = SK_WhiteComet_MeteorTarget()
    public let subSkills: SubSkills = [SK_WhiteComet_MeteorShard(),
                                       SK_WhiteComet_MeteorExplosion(),
                                       SK_WhiteComet_MeteorImpact()]
}

// MARK: - Meteor Target - 1st Strike
struct SK_WhiteComet_MeteorTarget_1stStrike: MainSubskill {
    let localizeTableName: String? = "Localizable_V_WhiteComet"
    let caption: String = "SK_WhiteComet_MeteorTarget_1stStrike_Caption"
    let content: String = "SK_WhiteComet_MeteorTarget_1stStrike_Content"
    let attackTag: AttackTag = .normal
}

extension SK_WhiteComet_MeteorTarget_1stStrike {
    var meleePhysicalDamageTransform: Percentage { return 1.0 }
}

// MARK: - Meteor Target - 2nd Strike
struct SK_WhiteComet_MeteorTarget_2ndStrike: MainSubskill {
    let localizeTableName: String? = "Localizable_V_WhiteComet"
    let caption: String = "SK_WhiteComet_MeteorTarget_2ndStrike_Caption"
    let content: String = "SK_WhiteComet_MeteorTarget_2ndStrike_Content"
    let attackTag: AttackTag = .normal
}

extension SK_WhiteComet_MeteorTarget_2ndStrike {
    var meleePhysicalDamageTransform: Percentage { return 0.50 }
    var rangedPhysicalDamageTransform: Percentage { return 0.50 }
}

// MARK: - Meteor Target - 3rd Strike
struct SK_WhiteComet_MeteorTarget_3rdStrike: MainSubskill {
    let localizeTableName: String? = "Localizable_V_WhiteComet"
    let caption: String = "SK_WhiteComet_MeteorTarget_3rdStrike_Caption"
    let content: String = "SK_WhiteComet_MeteorTarget_3rdStrike_Content"
    let attackTag: AttackTag = .normal
}

extension SK_WhiteComet_MeteorTarget_3rdStrike {
    var meleePhysicalDamageTransform: Percentage { return 0.50 }
    var rangedPhysicalDamageTransform: Percentage { return 0.50 }
}

// MARK: - Meteor Target - 4th Strike
struct SK_WhiteComet_MeteorTarget_4thStrike: MainSubskill {
    let localizeTableName: String? = "Localizable_V_WhiteComet"
    let caption: String = "SK_WhiteComet_MeteorTarget_4thStrike_Caption"
    let content: String = "SK_WhiteComet_MeteorTarget_4thStrike_Content"
    let attackTag: AttackTag = .normal
}

extension SK_WhiteComet_MeteorTarget_4thStrike {
    var meleePhysicalDamageTransform: Percentage { return 2 * 1.50 }
}

// MARK: - Meteor Target - 5th Strike
struct SK_WhiteComet_MeteorTarget_5thStrike: MainSubskill {
    let localizeTableName: String? = "Localizable_V_WhiteComet"
    let caption: String = "SK_WhiteComet_MeteorTarget_5thStrike_Caption"
    let content: String = "SK_WhiteComet_MeteorTarget_5thStrike_Content"
    let attackTag: AttackTag = .normal
}

extension SK_WhiteComet_MeteorTarget_5thStrike {
    var meleePhysicalDamageTransform: Percentage { return 2.50 }
}

// MARK: - Meteor Target
struct SK_WhiteComet_MeteorTarget: MainSkill {
    let localizeTableName: String? = "Localizable_V_WhiteComet"
    let caption: String = "SK_WhiteComet_MeteorTarget_Caption"
    let content: String = "SK_WhiteComet_MeteorTarget_Content"
    let attackTag: AttackTag = .normal
    let mainSubskills: [MainSubskill] = [SK_WhiteComet_MeteorTarget_1stStrike(),
                                         SK_WhiteComet_MeteorTarget_2ndStrike(),
                                         SK_WhiteComet_MeteorTarget_3rdStrike(),
                                         SK_WhiteComet_MeteorTarget_4thStrike(),
                                         SK_WhiteComet_MeteorTarget_5thStrike()]
}

// MARK: - Meteor Shard
struct SK_WhiteComet_MeteorShard: SubSkill {
    let localizeTableName: String? = "Localizable_V_WhiteComet"
    let caption: String = "SK_WhiteComet_MeteorShard_Caption"
    let content: String = "SK_WhiteComet_MeteorShard_Content"
    let attackTag: AttackTag = .none
    let skillUnlockRank: SkillUnlockRank = .none
}

extension SK_WhiteComet_MeteorShard {
    var code: MeasurableCode { return .SK_WhiteComet_MeteorShard }
    func determine(_ determination: Determination) -> Addition {
        switch determination.attackTag {
        case .normal, .branch, .charge: return [.physicalDamagePlus: 143.0]
        default:                        return [:]
        }
    }
}

// MARK: - Meteor Explosion
struct SK_WhiteComet_MeteorExplosion: SubSkill {
    let localizeTableName: String? = "Localizable_V_WhiteComet"
    let caption: String = "SK_WhiteComet_MeteorExplosion_Caption"
    let content: String = "SK_WhiteComet_MeteorExplosion_Content"
    let attackTag: AttackTag = .none
    let skillUnlockRank: SkillUnlockRank = .A
}

// MARK: - Meteor Impact
struct SK_WhiteComet_MeteorImpact: SubSkill {
    let localizeTableName: String? = "Localizable_V_WhiteComet"
    let caption: String = "SK_WhiteComet_MeteorImpact_Caption"
    let content: String = "SK_WhiteComet_MeteorImpact_Content"
    let attackTag: AttackTag = .none
    let skillUnlockRank: SkillUnlockRank = .SSS
}

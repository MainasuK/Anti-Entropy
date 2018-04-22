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
struct SK_WhiteComet_MeteorTarget_1stStrike: MainSubskill {
    let caption: String = "SK_WhiteComet_MeteorTarget_1stStrike_Caption"
    let content: String = "SK_WhiteComet_MeteorTarget_1stStrike_Content"
    let attackTag: AttackTag = .normal
}

extension SK_WhiteComet_MeteorTarget_1stStrike {
    var meleePhysicalDamageTransform: Percentage { return 1.0 }
}

// MARK: - Meteor Target - 2nd Strike
struct SK_WhiteComet_MeteorTarget_2ndStrike: MainSubskill {
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
    let caption: String = "SK_WhiteComet_MeteorTarget_4thStrike_Caption"
    let content: String = "SK_WhiteComet_MeteorTarget_4thStrike_Content"
    let attackTag: AttackTag = .normal
}

extension SK_WhiteComet_MeteorTarget_4thStrike {
    var meleePhysicalDamageTransform: Percentage { return 1.50 }
}

// MARK: - Meteor Target - 5th Strike
struct SK_WhiteComet_MeteorTarget_5thStrike: MainSubskill {
    let caption: String = "SK_WhiteComet_MeteorTarget_5thStrike_Caption"
    let content: String = "SK_WhiteComet_MeteorTarget_5thStrike_Content"
    let attackTag: AttackTag = .normal
}

extension SK_WhiteComet_MeteorTarget_5thStrike {
    var meleePhysicalDamageTransform: Percentage { return 2.50 }
}

// MARK: - Meteor Target
struct SK_WhiteComet_MeteorTarget: MainSkill {
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
    let caption: String = "SK_WhiteComet_MeteorShard_Caption"
    let content: String = "SK_WhiteComet_MeteorShard_Content"
    let attackTag: AttackTag = .none
    let skillUnlockRank: SkillUnlockRank = .none
}

extension SK_WhiteComet_MeteorShard {
    var physicalDamagePlus: Increment { return 143.0 }
}

// MARK: - Meteor Explosion
struct SK_WhiteComet_MeteorExplosion: SubSkill {
    let caption: String = "SK_WhiteComet_MeteorShard_Caption"
    let content: String = "SK_WhiteComet_MeteorShard_Content"
    let attackTag: AttackTag = .normal
    let skillUnlockRank: SkillUnlockRank = .A
}

extension SK_WhiteComet_MeteorExplosion {
    var physicalDamagePlus: Increment { return 1485.0 }
}

// MARK: - Meteor Impact
struct SK_WhiteComet_MeteorImpact: SubSkill {
    let attackTag: AttackTag = .none
    let skillUnlockRank: SkillUnlockRank = .SSS
}

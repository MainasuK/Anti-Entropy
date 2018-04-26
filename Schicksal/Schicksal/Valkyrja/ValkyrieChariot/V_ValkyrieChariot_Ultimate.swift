//
//  V_ValkyrieChariot_Ultimate.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-26.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public struct SKS_ValkyrieChariot_Ultimate: Skill {
    public let type: SkillType = .ultimate
    public let mainSkill: MainSkill = SK_ValkyrieChariot_VoidExplosion()
    public let subSkills: SubSkills = [SK_ValkyrieChariot_ParticleBeam(),
                                       SK_ValkyrieChariot_ParticleFusion(),
                                       SK_ValkyrieChariot_GravityTreaing()]
}


struct SK_ValkyrieChariot_VoidExplosion_BlackHole: MainSubskill {
    let localizeTableName: String? = "Localizable_V_ValkyrieChariot"
    let caption: String = "SK_ValkyrieChariot_VoidExplosion_BlackHole_Caption";
    let content: String = "SK_ValkyrieChariot_VoidExplosion_BlackHole_Content";
    let attackTag: AttackTag = .ultra
}

struct SK_ValkyrieChariot_VoidExplosion_GravitationalCollapse: MainSubskill {
    let localizeTableName: String? = "Localizable_V_ValkyrieChariot"
    let caption: String = "SK_ValkyrieChariot_VoidExplosion_GravitationalCollapse_Caption";
    let content: String = "SK_ValkyrieChariot_VoidExplosion_GravitationalCollapse_Content";
    let attackTag: AttackTag = .ultra
}

struct SK_ValkyrieChariot_VoidExplosion: MainSkill {
    let localizeTableName: String? = "Localizable_V_ValkyrieChariot"
    let caption: String = "SK_ValkyrieChariot_VoidExplosion_Caption";
    let content: String = "SK_ValkyrieChariot_VoidExplosion_Content";
    let attackTag: AttackTag = .ultra
    let mainSubskills: [MainSubskill] = [SK_ValkyrieChariot_VoidExplosion_BlackHole(),
                                         SK_ValkyrieChariot_VoidExplosion_GravitationalCollapse()]
}

struct SK_ValkyrieChariot_ParticleBeam: SubSkill {
    let localizeTableName: String? = "Localizable_V_ValkyrieChariot"
    let caption: String = "SK_ValkyrieChariot_ParticleBeam_Caption";
    let content: String = "SK_ValkyrieChariot_ParticleBeam_Content";
    let attackTag: AttackTag = .none
    let skillUnlockRank: SkillUnlockRank = .none
}

struct SK_ValkyrieChariot_ParticleFusion: SubSkill {
    let localizeTableName: String? = "Localizable_V_ValkyrieChariot"
    let caption: String = "SK_ValkyrieChariot_ParticleFusion_Caption";
    let content: String = "SK_ValkyrieChariot_ParticleFusion_Content";
    let attackTag: AttackTag = .none
    let skillUnlockRank: SkillUnlockRank = .S
}

struct SK_ValkyrieChariot_GravityTreaing: SubSkill {
    let localizeTableName: String? = "Localizable_V_ValkyrieChariot"
    let caption: String = "SK_ValkyrieChariot_GravityTreaing_Caption";
    let content: String = "SK_ValkyrieChariot_GravityTreaing_Content";
    let attackTag: AttackTag = .none
    let skillUnlockRank: SkillUnlockRank = .SSS
}

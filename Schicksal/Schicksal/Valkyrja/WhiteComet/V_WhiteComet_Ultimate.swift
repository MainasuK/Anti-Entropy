//
//  V_WhiteComet_Ultimate.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-17.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public struct SKS_WhiteComet_Ultimate: Skill {
    public let type: SkillType = .ultimate
    public let mainSkill: MainSkill = SK_WhiteComet_ValkyrieBurst()
    public let subSkills: SubSkills = [SK_WhiteComet_ValkyrieImpact(),
                                       SK_WhiteComet_ValkyrieBarrier(),
                                       SK_WhiteComet_ValkyrieCharge()]
}

// MARK: - Valkyrie Burst - Burst
struct SK_WhiteComet_ValkyrieBurst_Burst: MainSubskill {
    let localizeTableName: String? = "Localizable_V_WhiteComet"
    let caption: String = "SK_WhiteComet_ValkyrieBurst_Burst_Caption"
    let content: String = "SK_WhiteComet_ValkyrieBurst_Burst_Content"
    let attackTag: AttackTag = .none
}

// MARK: - Valkyrie Burst - Continuous Burst
struct SK_WhiteComet_ValkyrieBurst_ContinuousBurst: MainSubskill {
    let localizeTableName: String? = "Localizable_V_WhiteComet"
    let caption: String = "SK_WhiteComet_ValkyrieBurst_ContinuousBurst_Caption"
    let content: String = "SK_WhiteComet_ValkyrieBurst_ContinuousBurst_Content"
    let attackTag: AttackTag = .none
}

// MARK: - Valkyrie Burst
struct SK_WhiteComet_ValkyrieBurst: MainSkill {
    let localizeTableName: String? = "Localizable_V_WhiteComet"
    let caption: String = "SK_WhiteComet_ValkyrieBurst_Caption"
    let content: String = "SK_WhiteComet_ValkyrieBurst_Content"
    let attackTag: AttackTag = .none
    let mainSubskills: [MainSubskill] = [SK_WhiteComet_ValkyrieBurst_Burst(),
                                         SK_WhiteComet_ValkyrieBurst_ContinuousBurst()]
}

// MARK: - Valkyrie Impact
struct SK_WhiteComet_ValkyrieImpact: SubSkill {
    let localizeTableName: String? = "Localizable_V_WhiteComet"
    let caption: String = "SK_WhiteComet_ValkyrieImpact_Caption"
    let content: String = "SK_WhiteComet_ValkyrieImpact_Content"
    let attackTag: AttackTag = .none
    let skillUnlockRank: SkillUnlockRank = .none
}

extension SK_WhiteComet_ValkyrieImpact {
    func determine(_ determination: Determination) -> Addition {
        guard determination.attackable is SK_WhiteComet_ValkyrieImpact else {
            return [:]
        }

        return [.physicalDamageAffix: 2610.0]
    }
}

// MARK: - Valkyrie Barrier
struct SK_WhiteComet_ValkyrieBarrier: SubSkill {
    let localizeTableName: String? = "Localizable_V_WhiteComet"
    let caption: String = "SK_WhiteComet_ValkyrieBarrier_Caption"
    let content: String = "SK_WhiteComet_ValkyrieBarrier_Content"
    let attackTag: AttackTag = .none
    let skillUnlockRank: SkillUnlockRank = .S
}

// MARK: - Valkyrie Charge
struct SK_WhiteComet_ValkyrieCharge: SubSkill {
    let localizeTableName: String? = "Localizable_V_WhiteComet"
    let caption: String = "SK_WhiteComet_ValkyrieCharge_Caption"
    let content: String = "SK_WhiteComet_ValkyrieCharge_Content"
    let attackTag: AttackTag = .none
    let skillUnlockRank: SkillUnlockRank = .none
}

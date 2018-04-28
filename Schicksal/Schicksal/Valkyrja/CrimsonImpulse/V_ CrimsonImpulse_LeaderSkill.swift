//
//  V_ CrimsonImpulse_LeaderSkill.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-28.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

struct SK_CrimsonImpulse_SpiritOfLoyalty_SpiritOfLoyalty: MainSubskill {
    let localizeTableName: String? = "Localizable_V_CrimsonImpulse"
    let caption: String = "SK_CrimsonImpulse_SpiritOfLoyalty_SpiritOfLoyalty_Caption";
    let content: String = "SK_CrimsonImpulse_SpiritOfLoyalty_SpiritOfLoyalty_Content";
    let attackTag: AttackTag = .leader
}

extension SK_CrimsonImpulse_SpiritOfLoyalty_SpiritOfLoyalty {
    var scope: Scope { return .all }
    func determine(_ determination: Determination) -> Addition {
        guard determination.abilityState.contains(.combo) else {
            return [:]
        }

        return [.physicalDamageUP: 0.10]
    }
}

struct SK_CrimsonImpulse_SpiritOfLoyalty: MainSkill {
    let localizeTableName: String? = "Localizable_V_CrimsonImpulse"
    let caption: String = "SK_CrimsonImpulse_SpiritOfLoyalty_Caption";
    let content: String = "SK_CrimsonImpulse_SpiritOfLoyalty_Content";
    let attackTag: AttackTag = .leader
    let mainSubskills: [MainSubskill] = [SK_CrimsonImpulse_SpiritOfLoyalty_SpiritOfLoyalty()]
}

extension SK_CrimsonImpulse_SpiritOfLoyalty {
    var scope: Scope { return .all }
}

struct SK_CrimsonImpulse_SpiritOfLoyalty2: SubSkill {
    let localizeTableName: String? = "Localizable_V_CrimsonImpulse"
    let caption: String = "SK_CrimsonImpulse_SpiritOfLoyalty2_Caption";
    let content: String = "SK_CrimsonImpulse_SpiritOfLoyalty2_Content";
    let attackTag: AttackTag = .leader
    let skillUnlockRank: SkillUnlockRank = .A
}

extension SK_CrimsonImpulse_SpiritOfLoyalty2 {
    var scope: Scope { return .all }
    func determine(_ determination: Determination) -> Addition {
        guard determination.abilityState.contains(.combo) else {
            return [:]
        }

        return [.physicalDamageUP: 0.080]
    }
}

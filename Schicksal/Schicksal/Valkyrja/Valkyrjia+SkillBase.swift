//
//  Valkyrjia+SkillBase.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-20.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public protocol SkillTypeBase: Measurable {
    var skillType: DamageType { get }
    var skillUnlockRank: SkillUnlockRank { get }
    var damageTriggerType: DamageTriggerType { get }
}

extension SkillTypeBase {
    var skillUnlockRank: SkillUnlockRank { return .none }
    var damageTriggerType: DamageTriggerType { return .none }
}

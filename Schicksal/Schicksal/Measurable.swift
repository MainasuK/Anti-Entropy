//
//  Measurable.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-16.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public typealias Percentage = Double
public typealias Increment = Double

public enum AddtionType {
    case meleePhysicalDamagePlus
    case rangedPhysicalDamagePlus
    case physicalDamagePlus
    case elementDamagePlus
    case thunderDamagePlus
    case fireDamagePlus
    case iceDamagePlus

    case meleePhysicalDamageAffix
    case rangedPhysicalDamageAffix
    case physicalDamageAffix
    case elementDamageAffix
    case thunderDamageAffix
    case fireDamageAffix
    case iceDamageAffix

    case allDamageUP
    case meleePhysicalDamageUP
    case rangedPhysicalDamageUP
    case physicalDamageUP
    case thunderDamageUP
    case fireDamageUP
    case iceDamageUP
    case elementDamageUP

    case allDamageTakenUP
    case meleePhysicalDamageTakenUP
    case rangedPhysicalDamageTakenPlus
    case physicaldamageTakenUP
    case elementDamageTakenUP
    case thunderDamageTakenUP
    case fireDamageTakenUP
    case iceDamageTakenUP

    case criticalRateUP
    case criticalDamageUP
}

public typealias Addition = [AddtionType: Double]

public struct ActorHitType: OptionSet {
    public let rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    public static let melee   = ActorHitType(rawValue: 1 << 0)
    public static let ranged  = ActorHitType(rawValue: 1 << 1)
    public static let ailment = ActorHitType(rawValue: 1 << 2)
}

public struct Determination {
    public var attackable: Attackable?
    public var attackTag: AttackTag = .none
    public var abilityState: AbilityState = []

    public var actorHitType: ActorHitType {
        guard let attackable = attackable else {
            return []
        }

        if attackable.meleePhysicalDamageTransform > 0.0, attackable.rangedPhysicalDamageTransform > 0.0 {
            return [.melee, .ranged]
        }
        if attackable.meleePhysicalDamageTransform > 0.0 {
            return .melee
        }
        if attackable.rangedPhysicalDamageTransform > 0.0 {
            return .ranged
        }
        return .ailment
    }

    public init(attackable: Attackable? = nil, attackTag: AttackTag = .none, abilityState: AbilityState = []) {
        self.attackable = attackable
        self.attackTag = attackTag
        self.abilityState = abilityState
    }
}

public enum Scope {
    case oneself
    case others
    case all
}

public protocol Measurable {
    var code: MeasurableCode { get }
    var scope: Scope { get }
    func determine(_ determination: Determination) -> Addition
}

extension Measurable {
    public var code: MeasurableCode { return .none }
    public var scope: Scope { return .oneself }
    public func determine(_ determination: Determination) -> Addition {
        return [:]
    }
}
//    var damageUP: Percentage { get }
//    var physicalDamageUP: Percentage { get }
//    var physicalDamageComboAttackUP: Percentage { get }
//    var lightningDamageUP: Percentage { get }
//    var fireDamageUP: Percentage { get }
//    var iceDamageUP: Percentage { get }
//
//    var damageTakenUP: Percentage { get }
//    var physicalDamageTakenUP: Percentage { get }
//    var lightningDamageTakenUP: Percentage { get }
//    var fireDamageTakenUP: Percentage { get }
//    var iceDamageTakenUP: Percentage { get }
//
//    var criticalDamageUP: Percentage { get }
//
//    var meleePhysicalDamageTransform: Percentage { get }
//    var rangedPhysicalDamageTransform: Percentage { get }
//
//    var physicalDamageTransform
//
//    var physicalDamagePlus: Increment { get }
//
//    var fireDamagePlus: Increment { get }
//
//    var passiveCriticalDamageUP: Percentage { get }
//    var passiveHPUP: Percentage { get }

extension Measurable {
//    var normalPhysicalDamageUP: Percentage {
//        return (1 + damageUP) * (1 + physicalDamageUP)
//    }
//
//    var normalPhysicalDamageComboAttackUP: Percentage {
//        return (1 + damageUP) * (1 + physicalDamageUP + physicalDamageComboAttackUP)
//    }
//
//    var normalPhysicalDamgeWithDamgeTakenUP: Percentage {
//        return normalPhysicalDamageUP * (1 + damageTakenUP) * (1 + physicalDamageTakenUP)
//    }
//
//    var criticalPhysicalDamageUP: Percentage {
//        return normalPhysicalDamageUP * (2 + criticalDamageUP)
//    }
//
//    var criticalPhysicalDamageComboAttackUP: Percentage {
//        return normalPhysicalDamageComboAttackUP * (2 + criticalDamageUP)
//    }
//
//    var criticalPhysicalDamageWithDamgeTakenUP: Percentage {
//        return normalPhysicalDamgeWithDamgeTakenUP * (2 + criticalDamageUP)
//    }
//
//    var normalLightningDamageUP: Percentage {
//        return (1 + damageUP) * (1 + lightningDamageUP)
//    }
//
//    var normalLightningDamageWithDamgeTakenUP: Percentage {
//        return normalLightningDamageUP * (1 + damageTakenUP) * (1 + lightningDamageTakenUP)
//    }
//
//    var normalFireDamageUP: Percentage {
//        return (1 + damageUP) * (1 + fireDamageUP)
//    }
//
//    var normalFireDamageWithDamgeTakenUP: Percentage {
//        return normalFireDamageUP * (1 + damageTakenUP) * (1 + fireDamageTakenUP)
//    }
//
//    var normalIceDamageUP: Percentage {
//        return (1 + damageUP) * (1 + iceDamageUP)
//    }
//
//    var normalIceDamageWithDamgeTakenUP: Percentage {
//        return normalIceDamageUP * (1 + damageTakenUP) * (1 + iceDamageTakenUP)
//    }
}



extension Measurable {
//    public var damageUP: Percentage { return 0.0 }
//    public var physicalDamageUP: Percentage { return 0.0}
//    public var physicalDamageComboAttackUP: Percentage { return 0.0}
//    public var lightningDamageUP: Percentage { return 0.0 }
//    public var fireDamageUP: Percentage { return 0.0 }
//    public var iceDamageUP: Percentage { return 0.0 }
//    public var damageTakenUP: Percentage { return 0.0 }
//    public var physicalDamageTakenUP: Percentage { return 0.0 }
//    public var lightningDamageTakenUP: Percentage { return 0.0 }
//    public var fireDamageTakenUP: Percentage { return 0.0 }
//    public var iceDamageTakenUP: Percentage { return 0.0 }
//    public var criticalDamageUP: Percentage { return 0.0 }
//    public var meleePhysicalDamageTransform: Percentage { return 0.0 }
//    public var rangedPhysicalDamageTransform: Percentage { return 0.0 }
//    public var physicalDamagePlus: Increment { return 0.0 }
//    public var fireDamagePlus: Increment { return 0.0 }
//    public var passiveCriticalDamageUP: Percentage { return 0.0 }
//    public var passiveHPUP: Percentage { return 0.0 }

}

extension Percentage {
    public var propertyUP: Percentage {
        return self * (1 + 0.3)
    }

    public var propertyDown: Percentage {
        return self * (1 - 0.3)
    }
}

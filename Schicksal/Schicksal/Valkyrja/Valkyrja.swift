//
//  Valkyrja.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-16.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public protocol Valkyrja: Measurable {
    var code: ValkyrjaCode { get }

    var firstname: String { get }
    var lastname: String { get }
    var shortName: String { get }
    var fullName: String { get }
    var description: String { get }

    var localizeTableName: String? { get }
    var bundleIdentifier: String { get }

//    var recommendedWeaponForBeginners: Weapon { get }
//    var recommendedStigmataSuitForBeginners: StigmataSuit { get }
//
//    var recommendedWeaponForAdvancedPlayers: Weapon { get }
//    var recommendedStigmataSuitForAdvancedPlayers: StigmataSuit { get }

    var initialRank: ValkyrjaRank { get }
    var weaponType: [WeaponType] { get }
//    var initalWeapon: Weapon { get }
    var skills: Skills { get }

    var basicStatus: BasicStatus { get set }
    var rank: ValkyrjaRank { get set }
    var weapon: Weapon { get set }
//    var stigmataSuit: StigmataSuit { get }
}

extension Valkyrja {
    public var bundleIdentifier: String { return frameworkBundleIdentifier }
}

extension Valkyrja {
    public var measurables: [Measurable] {
        return skills.map { $0.measurables }.flatMap { $0 }
    }

//    public var critRate: Percentage {
//        return Percentage(basicStatus.CRT) / (75.0 + Percentage(basicStatus.LV) * 5.0)
//    }
}

// MARK: - Measurable
//extension Valkyrja {
//    public var damageUP: Percentage { return meashables.map { $0.damageUP }.reduce(0.0, +) }
//    public var physicalDamageUP: Percentage { return meashables.map { $0.physicalDamageUP }.reduce(0.0, +) }
//    public var physicalDamageComboAttackUP: Percentage { return meashables.map { $0.physicalDamageComboAttackUP }.reduce(0.0, +) }
//    public var lightningDamageUP: Percentage { return meashables.map { $0.lightningDamageUP }.reduce(0.0, +) }
//    public var fireDamageUP: Percentage { return meashables.map { $0.fireDamageUP }.reduce(0.0, +) }
//    public var iceDamageUP: Percentage { return meashables.map { $0.iceDamageUP }.reduce(0.0, +) }
//    public var damageTakenUP: Percentage { return meashables.map { $0.damageTakenUP }.reduce(0.0, +) }
//    public var physicalDamageTakenUP: Percentage { return meashables.map { $0.physicalDamageTakenUP }.reduce(0.0, +) }
//    public var lightningDamageTakenUP: Percentage { return meashables.map { $0.lightningDamageTakenUP }.reduce(0.0, +) }
//    public var fireDamageTakenUP: Percentage { return meashables.map { $0.fireDamageTakenUP }.reduce(0.0, +) }
//    public var iceDamageTakenUP: Percentage { return meashables.map { $0.iceDamageTakenUP }.reduce(0.0, +) }
//    public var criticalDamageUP: Percentage { return meashables.map { $0.criticalDamageUP }.reduce(0.0, +) }
//    public var meleePhysicalDamageTransform: Percentage { return 1.0 }
//    public var physicalDamagePlus: Increment { return meashables.map { $0.physicalDamagePlus }.reduce(0.0, +) }
//    public var fireDamagePlus: Increment { return meashables.map { $0.fireDamagePlus }.reduce(0.0, +) }
//}


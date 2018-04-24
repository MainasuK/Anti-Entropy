//
//  Attackable.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-22.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public typealias FormularType = (Attackable, [Addition]) -> FormularResult
public typealias FormularResult = (ATK) -> (DMG, DMG)

struct Formular {
    static let meleePhysicalDamage: FormularType = { (attackable: Attackable, additions: [Addition]) in
        let transform = attackable.meleePhysicalDamageTransform
        let magnifications: [Percentage] = [
            additions.reduce(1.0, { $0 + $1[.allDamageUP, default: 0.0] }),
            additions.reduce(1.0, { $0 + $1[.physicalDamageUP, default: 0.0] }),
            additions.reduce(1.0, { $0 + $1[.allDamageTakenUP, default: 0.0] }),
            additions.reduce(1.0, { $0 + $1[.physicaldamageTakenUP, default: 0.0] })
        ]

        return { (atk: ATK) in
            let direct = Double(atk) * transform * magnifications.reduce(1.0, *)
            let indirect = 0.0
            return (direct, indirect)
        }
    }
//    static var meleePhysicalDamageFormula: Formular = { additions in
//
//    }
//    static var rangedPhysicalDamageFormula: Formular = { additions in
//
//        return { ATK in
//            let direct = Double(ATK)
//            return (direct, 0.0)
//        }
//    }
//    static var thunderDamageFormula: Formular = { additions in
//
//        return { ATK in
//            let direct = Double(ATK)
//            return (direct, 0.0)
//        }
//    }
//    static var fireDamageFormula: Formular = { additions in
//
//        return { ATK in
//            let direct = Double(ATK)
//            return (direct, 0.0)
//        }
//    }
//    static var iceDamageFormula: Formular = { additions in
//
//        return { ATK in
//            let direct = Double(ATK)
//            return (direct, 0.0)
//        }
//    }
}

public protocol Attackable {

    var meleePhysicalDamageTransform: Percentage { get }
    var rangedPhysicalDamageTransform: Percentage { get }

    var thunderDamageTransform: Percentage { get }
    var fireDamageTransform: Percentage { get }
    var iceDamageTransform: Percentage { get }

    func attack(with basicStatus: BasicStatus, with measurables: [Measurable], under determination: Determination) -> DMG
}

extension Attackable {
    var meleePhysicalDamageTransform: Percentage { return 0.0 }
    var rangedPhysicalDamageTransform: Percentage { return 0.0 }

    var thunderDamageTransform: Percentage { return 0.0 }
    var fireDamageTransform: Percentage { return 0.0 }
    var iceDamageTransform: Percentage { return 0.0 }
}

extension Attackable {

    func attack(with basicStatus: BasicStatus, with measurables: [Measurable], under determination: Determination) -> DMG {
        var determination = determination

        if let skill = self as? SkillBase {
            determination.attackTag = skill.attackTag
        }

        let ATK = basicStatus.ATK
        let additions = measurables.map { $0.determine(determination) }

        let meleePhysicalDamage = Formular.meleePhysicalDamage(self, additions)(ATK)
//        let rangedPhysicalDamage = Self.rangedPhysicalDamageFormula(with: addtions)
//
//        let thunderDamage = Self.thunderDamageFormula(with: addtions)
//        let fireDamage = Self.fireDamageFormula(with: addtions)
//        let iceDamage = Self.iceDamageFormula(with: addtions)
//
//        let dmg = meleePhysicalDamage + rangedPhysicalDamage

//        return dmg
        return meleePhysicalDamage.0 + meleePhysicalDamage.1
    }

}

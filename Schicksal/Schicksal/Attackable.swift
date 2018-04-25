//
//  Attackable.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-22.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public typealias AttactResult = (DMG, DMG)

public typealias FormularType = (Attackable, [Addition]) -> FormularResult
public typealias FormularResult = (ATK) -> AttactResult

struct Formular {
    static let meleePhysicalDamage: FormularType = { (attackable: Attackable, additions: [Addition]) in
        let transform = attackable.meleePhysicalDamageTransform
        let magnifications: [Percentage] = [
            additions.reduce(1.0, { $0 + $1[.allDamageUP, default: 0.0] }),
            additions.reduce(1.0, { $0 + $1[.physicalDamageUP, default: 0.0] }),
            additions.reduce(1.0, { $0 + $1[.allDamageTakenUP, default: 0.0] }) ,
            additions.reduce(1.0, { $0 + $1[.physicaldamageTakenUP, default: 0.0] })
        ]

        let pluses: [DMG] = [
            additions.reduce(0.0, { $0 + $1[.physicalDamagePlus, default: 0.0] }),
            additions.reduce(0.0, { $0 + $1[.elementDamagePlus, default: 0.0] }),
            additions.reduce(0.0, { $0 + $1[.thunderDamagePlus, default: 0.0] }),
            additions.reduce(0.0, { $0 + $1[.fireDamagePlus, default: 0.0] }),
            additions.reduce(0.0, { $0 + $1[.iceDamagePlus, default: 0.0] }),
        ]

        let affix: [DMG] = [
            additions.reduce(0.0, { $0 + $1[.physicalDamageAffix, default: 0.0] }),
            additions.reduce(0.0, { $0 + $1[.elementDamageAffix, default: 0.0] }),
            max(additions.reduce(0.0, { $0 + $1[.thunderDamageAffix, default: 0.0] }),
                additions.reduce(0.0, { $0 + $1[.fireDamageAffix, default: 0.0] }),
                additions.reduce(0.0, { $0 + $1[.iceDamageAffix, default: 0.0] }))
        ]

        return { (atk: ATK) in
            let direct = Double(atk) * transform * magnifications.reduce(1.0, *) + pluses.reduce(0.0, +)
            let indirect = affix.reduce(0.0, +)
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

    var skillPhysicalDamagePlus: Increment { get }

    func attack(with basicStatus: BasicStatus, with measurables: [Measurable], under determination: Determination) -> DMG
    func attackResult(with basicStatus: BasicStatus, with measurables: [Measurable], under determination: Determination) -> AttactResult
}

extension Attackable {
    var meleePhysicalDamageTransform: Percentage { return 0.0 }
    var rangedPhysicalDamageTransform: Percentage { return 0.0 }

    var thunderDamageTransform: Percentage { return 0.0 }
    var fireDamageTransform: Percentage { return 0.0 }
    var iceDamageTransform: Percentage { return 0.0 }

    var skillPhysicalDamagePlus: Increment { return 0.0 }
}

extension Attackable {

    func attack(with basicStatus: BasicStatus, with measurables: [Measurable], under determination: Determination) -> DMG {
        let result = attackResult(with: basicStatus, with: measurables, under: determination)
        return result.0 + result.1
    }

    func attackResult(with basicStatus: BasicStatus, with measurables: [Measurable], under determination: Determination) -> AttactResult {
        let determination = configure(determination: determination)
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
        return (meleePhysicalDamage.0 + skillPhysicalDamagePlus,
                meleePhysicalDamage.1)
    }

    func effectiveMeasurables(in measurables: [Measurable], under determination: Determination) -> [Measurable] {
        let determination = configure(determination: determination)
        return measurables.filter {
            let additions = $0.determine(determination)
            return additions.first(where: { (_, value) in value > 0.0 }) != nil
        }
    }

    private func configure(determination: Determination) -> Determination {
        var determination = determination
        if let skill = self as? SkillBase {
            determination.attackTag = skill.attackTag
        }
        determination.attackable = self

        return determination
    }

}

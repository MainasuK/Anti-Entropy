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
    static let damage: FormularType = { (attackable: Attackable, additions: [Addition]) in

        // UP
        let allDamageUP                   = additions.reduce(0.0, { $0 + $1[.allDamageUP, default: 0.0] })
        let meleePhysicalDamageUP         = additions.reduce(0.0, { $0 + $1[.meleePhysicalDamageUP, default: 0.0] })
        let rangedPhysicalDamageUP        = additions.reduce(0.0, { $0 + $1[.rangedPhysicalDamageUP, default: 0.0] })
        let physicalDamageUP              = additions.reduce(0.0, { $0 + $1[.physicalDamageUP, default: 0.0] })
        let thunderDamageUP               = additions.reduce(0.0, { $0 + $1[.thunderDamageUP, default: 0.0] })
        let fireDamageUP                  = additions.reduce(0.0, { $0 + $1[.fireDamageUP, default: 0.0] })
        let iceDamageUP                   = additions.reduce(0.0, { $0 + $1[.iceDamageUP, default: 0.0] })
        let elementDamageUP               = additions.reduce(0.0, { $0 + $1[.elementDamageUP, default: 0.0] })

        // Taken UP
        let allDamageTakenUP              = additions.reduce(0.0, { $0 + $1[.allDamageTakenUP, default: 0.0] })
        let meleePhysicalDamageTakenUP    = additions.reduce(0.0, { $0 + $1[.meleePhysicalDamageTakenUP, default: 0.0] })
        let rangedPhysicalDamageTakenPlus = additions.reduce(0.0, { $0 + $1[.allDamageTakenUP, default: 0.0] })
        let physicaldamageTakenUP         = additions.reduce(0.0, { $0 + $1[.physicaldamageTakenUP, default: 0.0] })
        let thunderDamageTakenUP          = additions.reduce(0.0, { $0 + $1[.thunderDamageTakenUP, default: 0.0] })
        let fireDamageTakenUP             = additions.reduce(0.0, { $0 + $1[.fireDamageTakenUP, default: 0.0] })
        let iceDamageTakenUP              = additions.reduce(0.0, { $0 + $1[.iceDamageTakenUP, default: 0.0] })
        let elementDamageTakenUP          = additions.reduce(0.0, { $0 + $1[.elementDamageTakenUP, default: 0.0] })

        // Plus
        let meleePhysicalDamagePlus       = additions.reduce(0.0, { $0 + $1[.meleePhysicalDamagePlus, default: 0.0] })
        let rangedPhysicalDamagePlus      = additions.reduce(0.0, { $0 + $1[.rangedPhysicalDamagePlus, default: 0.0] })
        let physicalDamagePlus            = additions.reduce(0.0, { $0 + $1[.physicalDamagePlus, default: 0.0] })
        let thunderDamagePlus             = additions.reduce(0.0, { $0 + $1[.thunderDamagePlus, default: 0.0] })
        let fireDamagePlus                = additions.reduce(0.0, { $0 + $1[.fireDamagePlus, default: 0.0] })
        let iceDamagePlus                 = additions.reduce(0.0, { $0 + $1[.iceDamagePlus, default: 0.0] })
        let elementDamagePlus             = additions.reduce(0.0, { $0 + $1[.elementDamagePlus, default: 0.0] })

        // Affix
        let physicalDamageAffix           = additions.reduce(0.0, { $0 + $1[.physicalDamageAffix, default: 0.0] })
        let elementDamageAffix            = additions.reduce(0.0, { $0 + $1[.elementDamageAffix, default: 0.0] }) +
                                        max(additions.reduce(0.0, { $0 + $1[.thunderDamageAffix, default: 0.0] }),
                                            additions.reduce(0.0, { $0 + $1[.fireDamageAffix, default: 0.0] }),
                                            additions.reduce(0.0, { $0 + $1[.iceDamageAffix, default: 0.0] }))

        let meleePhysicalDamageMagnification: Percentage = [
            1.0 + allDamageUP,
            1.0 + meleePhysicalDamageUP + physicalDamageUP,
            1.0 + allDamageTakenUP,
            1.0 + meleePhysicalDamageTakenUP + physicaldamageTakenUP
        ].reduce(1.0, *)

        let rangedPhysicalDamageMagnification: Percentage = [
            1.0 + allDamageUP,
            1.0 + rangedPhysicalDamageUP + physicalDamageUP,
            1.0 + allDamageTakenUP,
            1.0 + rangedPhysicalDamageTakenPlus + physicaldamageTakenUP
        ].reduce(1.0, *)

        let thunderDamageMagnification: Percentage = [
            1.0 + allDamageUP,
            1.0 + thunderDamageUP + elementDamageUP,
            1.0 + allDamageTakenUP,
            1.0 + thunderDamageTakenUP + elementDamageTakenUP
        ].reduce(1.0, *)

        let fireDamageMagnification: Percentage = [
            1.0 + allDamageUP,
            1.0 + fireDamageUP + elementDamageUP,
            1.0 + allDamageTakenUP,
            1.0 + fireDamageTakenUP + elementDamageTakenUP
            ].reduce(1.0, *)

        let iceDamageMagnification: Percentage = [
            1.0 + allDamageUP,
            1.0 + iceDamageUP + elementDamageUP,
            1.0 + allDamageTakenUP,
            1.0 + iceDamageTakenUP + elementDamageTakenUP
            ].reduce(1.0, *)

        return { (atk: ATK) in
            let physical =
                Double(atk) * attackable.meleePhysicalDamageTransform * meleePhysicalDamageMagnification +
                Double(atk) * attackable.rangedPhysicalDamageTransform * rangedPhysicalDamageMagnification +
                physicalDamagePlus

            let element =
                Double(atk) * attackable.thunderDamageTransform * thunderDamageMagnification +
                Double(atk) * attackable.fireDamageTransform * fireDamageMagnification +
                Double(atk) * attackable.iceDamageTransform * iceDamageMagnification

            let direct = physical + element

            let indirect = physicalDamageAffix + elementDamageAffix
            return (direct, indirect)
        }
    }

}

public protocol Attackable {

    var meleePhysicalDamageTransform: Percentage { get }
    var rangedPhysicalDamageTransform: Percentage { get }

    var thunderDamageTransform: Percentage { get }
    var fireDamageTransform: Percentage { get }
    var iceDamageTransform: Percentage { get }

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

        let meleePhysicalDamage = Formular.damage(self, additions)(ATK)

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

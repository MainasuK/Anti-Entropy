//
//  Valkyrja.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-16.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public typealias DMG = Double

public enum Property {
    case creature
    case psychic
    case mecha
}

public struct BasicStatus {
    public var HP: HP
    public var SP: SP
    public var ATK: ATK
    public var DEF: DEF
    public var CRT: CRT

    public init(HP: HP, SP: SP, ATK: ATK, DEF: DEF, CRT: CRT) {
        self.HP  = HP
        self.SP  = SP
        self.ATK = ATK
        self.DEF = DEF
        self.CRT = CRT
    }
}

extension BasicStatus {

    public func DMG(for measurables: [Measurable], with trigger: DamageTrigger = [:], with buff: [Measurable] = []) -> DMG {
        let physicalDamageDirect = measurables.map { $0.physicalDamageTransform }.reduce(0, +) * Double(ATK)
        let physicalDamagePlus = [measurables, buff].flatMap { $0 }.map { $0.physicalDamagePlus }.reduce(0, +)

        let physicalDamage = physicalDamageDirect + physicalDamagePlus
        let fireDamage = measurables.map { $0.fireDamagePlus }.reduce(0, +)

        return physicalDamage + fireDamage
    }

}

public typealias Skills = [Skill]
public typealias SubSkills = [SubSkill]

enum DamageType {
    case physicalDirect
    case physicalIndirect
    case lightingDirect
    case lightingIndirect
    case fireDirect
    case fireIndirect
    case iceDirect
    case iceIndirect
    case summons
}

public typealias DamageTrigger = [DamageTriggerType: Bool]

public enum DamageTriggerType {
    case combo
    case passive
}

public enum Skill {
    case specialAttack(MainSkill, SubSkills)
    case ultimate(MainSkill, SubSkills)
    case basicAttack(MainSkill, SubSkills)
    case evasion(MainSkill, SubSkills)
    case passiveSkill(MainSkill, SubSkills)
    case leaderSkill(MainSkill, SubSkills)
}

extension Skill {

    public var text: String {
        switch self {
        case .specialAttack: return "Special Attack"
        case .ultimate:      return "Ultimate"
        case .basicAttack:   return "Basic Attack"
        case .evasion:       return "Evasion"
        case .passiveSkill:  return "Passive Skill"
        case .leaderSkill:   return "Leader Skill"
        }
    }

}

extension Skill {

    public var mainSkill: MainSkill {
        switch self {
        case let .specialAttack(main, _): return main
        case let .ultimate(main, _):      return main
        case let .basicAttack(main, _):   return main
        case let .evasion(main, _):       return main
        case let .passiveSkill(main, _):  return main
        case let .leaderSkill(main, _):   return main
        }
    }

    public var subskills: SubSkills {
        switch self {
        case let .specialAttack(_, sub): return sub
        case let .ultimate(_, sub):      return sub
        case let .basicAttack(_, sub):   return sub
        case let .evasion(_, sub):       return sub
        case let .passiveSkill(_, sub):  return sub
        case let .leaderSkill(_, sub):   return sub
        }
    }

    public var skillTypes: [SkillTypeBase] {
        let arrays = [[mainSkill] as [SkillTypeBase],
                     mainSkill.mainSubskills as [SkillTypeBase],
                     subskills as [SkillTypeBase]]
        return arrays.flatMap { $0 }
    }

    public var count: Int {
        switch self {
        case let .specialAttack(main, sub):
            return 1 + main.mainSubskills.count + sub.count
        case let .ultimate(main, sub):
            return 1 + main.mainSubskills.count + sub.count
        case let .basicAttack(main, sub):
            return 1 + main.mainSubskills.count + sub.count
        case let .evasion(main, sub):
            return 1 + main.mainSubskills.count + sub.count
        case let .passiveSkill(main, sub):
            return 1 + main.mainSubskills.count + sub.count
        case let .leaderSkill(main, sub):
            return 1 + main.mainSubskills.count + sub.count
        }
    }

}

public protocol SkillTypeBase: Measurable {
    var skillType: SkillType { get }
    var skillUnlockRank: SkillUnlockRank { get }
}

public enum SkillType {
    case normal
    case switchSkill
    case comboSkill
    case QTE
    case buff
    case debuff
}

extension SkillType {

    public var text: String? {
        switch self {
        case .normal:       return nil
        case .switchSkill:  return "Switch Skill"
        case .comboSkill:   return "Combo Skill"
        case .QTE:          return "QTE"
        case .buff:         return nil
        case .debuff:       return nil
        }
    }

}

public enum SkillUnlockRank: Int {
    case none = 0
    case A    = 1
    case S    = 2
    case SS   = 3
    case SSS  = 4
}

extension SkillUnlockRank {

    public var text: String? {
        switch self {
        case .none: return nil
        case .A:    return "A"
        case .S:    return "S"
        case .SS:   return "SS"
        case .SSS:  return "SSS"
        }
    }
    
}

public protocol MainSubskill: SkillTypeBase {
    var explanation: Explanation { get }
}

extension MainSubskill {
    var skillUnlockRank: SkillUnlockRank { return .none }
}

public protocol MainSkill: SkillTypeBase {
    var explanation: Explanation { get }
    var mainSubskills: [MainSubskill] { get }
}

extension MainSkill {
    var skillUnlockRank: SkillUnlockRank { return .none }
}

public protocol SubSkill: SkillTypeBase {
    var explanation: Explanation { get }
}

public protocol Valkyrja: Measurable {
    var nickname: Explanation { get }
    var realname: Explanation { get }
    var characteristics: Explanation { get }
    var property: Property { get }
    
    var lv: LV { get }
    var basicStatus: BasicStatus { get }
    var weapon: Weapon { get }
    var stigmataSuit: StigmataSuit { get }
    var skills: Skills { get }
}

extension Valkyrja {
    public var meashables: [Measurable] {
        var arr = [Measurable]()
        arr.append(weapon)
        arr.append(contentsOf: Array(stigmataSuit.suit.values))
        return arr
    }

    public var critRate: Percentage {
        return Percentage(basicStatus.CRT) / (75.0 + Percentage(lv) * 5.0)
    }
}

// MARK: - Measurable
extension Valkyrja {
    public var damageUP: Percentage { return meashables.map { $0.damageUP }.reduce(0.0, +) }
    public var physicalDamageUP: Percentage { return meashables.map { $0.physicalDamageUP }.reduce(0.0, +) }
    public var physicalDamageComboAttackUP: Percentage { return meashables.map { $0.physicalDamageComboAttackUP }.reduce(0.0, +) }
    public var lightningDamageUP: Percentage { return meashables.map { $0.lightningDamageUP }.reduce(0.0, +) }
    public var fireDamageUP: Percentage { return meashables.map { $0.fireDamageUP }.reduce(0.0, +) }
    public var iceDamageUP: Percentage { return meashables.map { $0.iceDamageUP }.reduce(0.0, +) }
    public var damageTakenUP: Percentage { return meashables.map { $0.damageTakenUP }.reduce(0.0, +) }
    public var physicalDamageTakenUP: Percentage { return meashables.map { $0.physicalDamageTakenUP }.reduce(0.0, +) }
    public var lightningDamageTakenUP: Percentage { return meashables.map { $0.lightningDamageTakenUP }.reduce(0.0, +) }
    public var fireDamageTakenUP: Percentage { return meashables.map { $0.fireDamageTakenUP }.reduce(0.0, +) }
    public var iceDamageTakenUP: Percentage { return meashables.map { $0.iceDamageTakenUP }.reduce(0.0, +) }
    public var criticalDamageUP: Percentage { return meashables.map { $0.criticalDamageUP }.reduce(0.0, +) }
    public var physicalDamageTransform: Percentage { return 1.0 }
    public var physicalDamagePlus: Increment { return meashables.map { $0.physicalDamagePlus }.reduce(0.0, +) }
    public var fireDamagePlus: Increment { return meashables.map { $0.fireDamagePlus }.reduce(0.0, +) }
}


//
//  Stigmata.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-16.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public typealias StigmataTag = String
public typealias StarRank = Int

public enum StigmataPosition: String, Codable {
    case T
    case C      // a.k.a M
    case B
}

public enum StigmataLv: Int, Codable {
    /// 5
    case five       = 5
    /// 15
    case fifteen    = 15
    /// 25
    case twentyFive = 25
    /// 35
    case thirtyFive = 35
    /// 50
    case fifty      = 50
}

struct EmptyStigmataSetSkill: Measurable {
    let damageUP: Percentage               = 0.0
    let physicalDamageUP: Percentage       = 0.0
    let lightningDamageUP: Percentage      = 0.0
    let fireDamageUP: Percentage           = 0.0
    let iceDamageUP: Percentage            = 0.0
    let damageTakenUP: Percentage          = 0.0
    let physicalDamageTakenUP: Percentage  = 0.0
    let lightningDamageTakenUP: Percentage = 0.0
    let fireDamageTakenUP: Percentage      = 0.0
    let iceDamageTakenUP: Percentage       = 0.0
    let criticalDamageUP: Percentage       = 0.0
}

//protocol StigmataSetSkill {
//    var twoSuits: Explainable { get }
//    var threeSuits: Explainable { get }
//
//    var twoSuitEffect: Measurable { get }
//    var threeSuitEffect: Measurable { get }
//
//    var twoSuitEffectSwitch: Bool { get set }
//    var threeSuitEffectSwitch: Bool { get set }
//}

public protocol Stigmata: Measurable {
    var tag: StigmataTag { get }
    var position: StigmataPosition { get }
    var starRank: StarRank { get }
    var lvRank: [StigmataLv] { get }

    var currentLv: StigmataLv { get set }

    var HP: HP { get }
    var ATK: ATK { get }
    var CRT: CRT { get }
    var DEF: DEF { get }
}

extension Stigmata {

    private var positionName: String {
        switch position {
        case .T: return " (T)"
//            return NSLocalizedString(<#T##key: String##String#>, comment: <#T##String#>)
        case .C: return " (C)"
        case .B: return " (B)"
        }
    }

    public var name: String {
//        return explanation.caption + positionName
        return positionName
    }

    var skillExplainable: String { return "" }
    public var twoSetsSkillExplainable: String { return "" }
    public var threeSetsSkillExplainable: String { return "" }

}

public struct StigmataSuit: Codable {
//    public var suit: [StigmataPosition: Stigmata]
//
//    public init(suit: [StigmataPosition: Stigmata] = [:]) {
//        self.suit = suit
//    }
}

extension StigmataSuit {

    var isTwoSuit: Bool {
//        guard suit.values.count != 1 else {
//            return false
//        }
//
//        let topTag = suit.filter({ $0.key == .T }).first?.value.tag
//        let centerTag = suit.filter({ $0.key == .C }).first?.value.tag
//        let bottomTag = suit.filter({ $0.key == .B }).first?.value.tag
//
//        if topTag == centerTag { return true }
//        if topTag == bottomTag { return true }
//        if centerTag == bottomTag { return true }

        return false
    }

    var isThreeSuit: Bool {
//        guard suit.values.count == 3 else {
//            return false
//        }
//
//        let topTag = suit.filter({ $0.key == .T }).first?.value.tag
//        let centerTag = suit.filter({ $0.key == .C }).first?.value.tag
//        let bottomTag = suit.filter({ $0.key == .B }).first?.value.tag
//
//        if topTag == centerTag, centerTag == bottomTag { return true }

        return false
    }
    
}

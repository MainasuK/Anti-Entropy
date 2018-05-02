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

public enum StigmataSlot {
    case T
    case C      // a.k.a M
    case B
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
    var slot: StigmataSlot { get }
    var rarity: [Rarity] { get }

    var currentRarity: Rarity { get set }

    var HP: HP { get }
    var ATK: ATK { get }
    var CRT: CRT { get }
    var DEF: DEF { get }
}

extension Stigmata {

    var skillExplainable: String { return "" }
    public var twoSetsSkillExplainable: String { return "" }
    public var threeSetsSkillExplainable: String { return "" }

}

@objc public enum StigmataCode: Int {
    case none
    case jixuanyuanAqua_T_L
    case jixuanyuanAqua_T_H
    case jixuanyuanAqua_C_L
    case jixuanyuanAqua_C_H
    case jixuanyuanAqua_B_L
    case jixuanyuanAqua_B_H
}

public struct StigmataSuit {
    var T: Stigmata?
    var C: Stigmata?
    var B: Stigmata?

    public init() { }

    public init(T: Stigmata?, C: Stigmata?, B: Stigmata?) {
        self.T = T
        self.C = C
        self.B = B
    }
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

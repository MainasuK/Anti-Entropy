//
//  Property.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-16.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public typealias HP  = Int
public typealias SP  = Int
public typealias ATK = Int
public typealias DEF = Int
public typealias CRT = Int
public typealias LV  = Int

public typealias DMG = Double

public protocol Explainable {
    var caption: String { get }
    var content: String { get }
    var localizeTableName: String? { get }
    var bundleIdentifier: String { get }
}

extension Explainable {
    var caption: String { return "" }
    var content: String { return "" }
    var localizeTableName: String? { return nil }
    var bundleIdentifier: String { return frameworkBundleIdentifier }
}

public struct AbilityState: OptionSet {
    public let rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    static let invincible               = AbilityState(rawValue: 1 << 0)        // 无敌
    static let limbo                    = AbilityState(rawValue: 1 << 1)        //
    static let witchTimeSlowed          = AbilityState(rawValue: 1 << 2)        // 时空减速
    static let bleed                    = AbilityState(rawValue: 1 << 3)        // 流血
    static let stun                     = AbilityState(rawValue: 1 << 4)        // 眩晕
    static let count                    = AbilityState(rawValue: 1 << 5)        //
    static let paralyze                 = AbilityState(rawValue: 1 << 6)        // 麻痹
    static let burn                     = AbilityState(rawValue: 1 << 7)        // 燃烧
    static let poisoned                 = AbilityState(rawValue: 1 << 8)        // 中毒
    static let frozen                   = AbilityState(rawValue: 1 << 9)        // 冰冻
    static let moveSpeedDown            = AbilityState(rawValue: 1 << 10)       // 移速降低
    static let attackSpeedDown          = AbilityState(rawValue: 1 << 11)       // 攻速降低
    static let weak                     = AbilityState(rawValue: 1 << 12)       // 虚弱
    static let fragile                  = AbilityState(rawValue: 1 << 13)       // 脆弱
    static let endure                   = AbilityState(rawValue: 1 << 14)       //
    static let moveSpeedUp              = AbilityState(rawValue: 1 << 15)       // 移速提升
    static let attackSpeedUp            = AbilityState(rawValue: 1 << 16)       // 攻速提升
    static let powerUp                  = AbilityState(rawValue: 1 << 17)       // 攻击提升
    static let shielded                 = AbilityState(rawValue: 1 << 18)       // 护盾
    static let critUp                   = AbilityState(rawValue: 1 << 19)       // 暴击率提升
    static let immune                   = AbilityState(rawValue: 1 << 20)       // 免疫
    static let maxMoveSpeed             = AbilityState(rawValue: 1 << 21)       // 最大移速
    static let targetLocked             = AbilityState(rawValue: 1 << 22)       // 目标锁定
    static let tied                     = AbilityState(rawValue: 1 << 23)       // 禁锢
    static let blockAnimEventAttack     = AbilityState(rawValue: 1 << 24)       //
    static let undamagable              = AbilityState(rawValue: 1 << 25)       // 不可伤害
    static let reflectBullet            = AbilityState(rawValue: 1 << 26)       // 反射子弹
    static let slowWhenFrozenOrParalyze = AbilityState(rawValue: 1 << 27)       // 冰冻/麻痹时迟缓
    static let utilityState             = AbilityState(rawValue: 1 << 28)       //
    static let chaos                    = AbilityState(rawValue: 1 << 29)       //
    static let invisible                = AbilityState(rawValue: 1 << 30)       // 隐身

    static let none: AbilityState   = []
    static let debuff: AbilityState = [.bleed, .stun, .paralyze, .burn, .poisoned, .frozen, .moveSpeedDown, .attackSpeedDown, .weak, .fragile, . targetLocked, .tied, .chaos]
    static let buff: AbilityState   = [.endure, .moveSpeedUp, .attackSpeedUp, .powerUp, .shielded, .critUp, .immune, .maxMoveSpeed, .undamagable, .invisible]
}

public enum AttackTag {
    case none
    case normal             // 普通攻击
    case branch             // 分支
    case charge             // 蓄力攻击
    case ultra              // 爆发状态
    case weapon             // 武器技能
    case switchIn           // 出场技
    case QTE                // QTE
    case evade              // 闪避
    case defend             // 防御
    case assassin           // 刺杀
    case mpTeamSkill        // 团队
}

extension AttackTag {

    public var text: String? {
        switch self {
        case .branch:       return "Combo Skill"
        case .switchIn:     return "Switch Skill"
        case .QTE:          return "QTE"
        default:            return nil
        }
    }

}

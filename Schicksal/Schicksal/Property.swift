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
    public var caption: String { return "" }
    public var content: String { return "" }
    public var localizeTableName: String? { return nil }
    public var bundleIdentifier: String { return frameworkBundleIdentifier }
}

public struct AbilityState: OptionSet {
    public let rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    public static let invincible               = AbilityState(rawValue: 1 << 0)        // 无敌
    public static let limbo                    = AbilityState(rawValue: 1 << 1)        //
    public static let witchTimeSlowed          = AbilityState(rawValue: 1 << 2)        // 时空减速
    public static let bleed                    = AbilityState(rawValue: 1 << 3)        // 流血
    public static let stun                     = AbilityState(rawValue: 1 << 4)        // 眩晕
    public static let count                    = AbilityState(rawValue: 1 << 5)        //
    public static let paralyze                 = AbilityState(rawValue: 1 << 6)        // 麻痹
    public static let burn                     = AbilityState(rawValue: 1 << 7)        // 燃烧
    public static let poisoned                 = AbilityState(rawValue: 1 << 8)        // 中毒
    public static let frozen                   = AbilityState(rawValue: 1 << 9)        // 冰冻
    public static let moveSpeedDown            = AbilityState(rawValue: 1 << 10)       // 移速降低
    public static let attackSpeedDown          = AbilityState(rawValue: 1 << 11)       // 攻速降低
    public static let weak                     = AbilityState(rawValue: 1 << 12)       // 虚弱
    public static let fragile                  = AbilityState(rawValue: 1 << 13)       // 脆弱
    public static let endure                   = AbilityState(rawValue: 1 << 14)       //
    public static let moveSpeedUp              = AbilityState(rawValue: 1 << 15)       // 移速提升
    public static let attackSpeedUp            = AbilityState(rawValue: 1 << 16)       // 攻速提升
    public static let powerUp                  = AbilityState(rawValue: 1 << 17)       // 攻击提升
    public static let shielded                 = AbilityState(rawValue: 1 << 18)       // 护盾
    public static let critUp                   = AbilityState(rawValue: 1 << 19)       // 暴击率提升
    public static let immune                   = AbilityState(rawValue: 1 << 20)       // 免疫
    public static let maxMoveSpeed             = AbilityState(rawValue: 1 << 21)       // 最大移速
    public static let targetLocked             = AbilityState(rawValue: 1 << 22)       // 目标锁定
    public static let tied                     = AbilityState(rawValue: 1 << 23)       // 禁锢
    public static let blockAnimEventAttack     = AbilityState(rawValue: 1 << 24)       //
    public static let undamagable              = AbilityState(rawValue: 1 << 25)       // 不可伤害
    public static let reflectBullet            = AbilityState(rawValue: 1 << 26)       // 反射子弹
    public static let slowWhenFrozenOrParalyze = AbilityState(rawValue: 1 << 27)       // 冰冻/麻痹时迟缓
    public static let utilityState             = AbilityState(rawValue: 1 << 28)       //
    public static let chaos                    = AbilityState(rawValue: 1 << 29)       //
    public static let invisible                = AbilityState(rawValue: 1 << 30)       // 隐身

    public static let airborne                 = AbilityState(rawValue: 1 << 31)       // 浮空

    public static let none: AbilityState   = []
    public static let debuff: AbilityState = [.bleed, .stun, .paralyze, .burn, .poisoned, .frozen, .moveSpeedDown, .attackSpeedDown, .weak, .fragile, . targetLocked, .tied, .chaos]
    public static let buff: AbilityState   = [.endure, .moveSpeedUp, .attackSpeedUp, .powerUp, .shielded, .critUp, .immune, .maxMoveSpeed, .undamagable, .invisible]
}

public enum AttackTag: Explainable {
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
    case leader             // 队长
}

extension AttackTag {

    public var caption: String {
        switch self {
        case .branch:       return "Attack_Tag_Branch"
        case .switchIn:     return "Attack_Tag_SwitchIn"
        case .QTE:          return "Attack_Tag_QTE"
        default:
            return ""
        }
    }

    public var content: String {
        return caption
    }

}

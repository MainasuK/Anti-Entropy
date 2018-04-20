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

public protocol Explainable: Codable {
    var caption: String { get }
    var content: String { get }
}

extension Explainable {
    var caption: String { return "" }
    var content: String { return "" }
}

public typealias DamageTrigger = [DamageTriggerType: Bool]

public enum DamageTriggerType: String, Codable {
    case none
    case combo
}

public enum DamageType: String, Codable {
    case normal             // 普攻攻击
    case charging           // 蓄力攻击
    case switchSkill        // 出场技
    case comboSkill         // 分支
    case QTE                // QTE
    case goddess            // 爆发状态
    case weapon             // 武器技能
    case buff
    case debuff
}

extension DamageType {

    public var text: String? {
        switch self {
        case .switchSkill:  return "Switch Skill"
        case .comboSkill:   return "Combo Skill"
        case .QTE:          return "QTE"
        default:            return nil
        }
    }

}

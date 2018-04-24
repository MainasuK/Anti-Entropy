//
//  Valkyrjia+Skill.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-20.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public typealias Skills = [Skill]
public typealias SubSkills = [SubSkill]

public enum SkillType {
    case specialAttack
    case ultimate
    case basicAttack
    case evasion
    case passiveSkill
    case leaderSkill
}

public protocol Skill: Explainable {
    var type: SkillType { get }
    var mainSkill: MainSkill { get }
    var subSkills: SubSkills { get }
}

extension Skill {

    public var caption: String {
        switch type {
        case .specialAttack: return "Special Attack"
        case .ultimate:      return "Ultimate"
        case .basicAttack:   return "Basic Attack"
        case .evasion:       return "Evasion"
        case .passiveSkill:  return "Passive Skill"
        case .leaderSkill:   return "Leader Skill"
        }
    }
    
    public var content: String {
        return caption
    }

}

extension Skill {

    public var measurables: [Measurable] {
        return ([[mainSkill], mainSkill.mainSubskills, subSkills] as [[Measurable]]).flatMap { $0 }
    }

    public var count: Int {
        return 1 + mainSkill.mainSubskills.count + subSkills.count
    }

}

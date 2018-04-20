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

public enum SkillType: String, Codable {
    case specialAttack
    case ultimate
    case basicAttack
    case evasion
    case passiveSkill
    case leaderSkill
}

public protocol Skill: Codable {
    var type: SkillType { get }
    var mainSkill: MainSkill { get }
    var subskills: SubSkills { get }
}

extension Skill {

    public var text: String {
        switch type {
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

//    public var skillTypes: [SkillTypeBase] {
//        let arrays = [[mainSkill] as [SkillTypeBase],
//                      mainSkill.mainSubskills as [SkillTypeBase],
//                      subskills as [SkillTypeBase]]
//        return arrays.flatMap { $0 }
//    }

    public var count: Int {
        return 1
//        return 1 + mainSkill.mainSubskills.count + subskills.count
    }

}

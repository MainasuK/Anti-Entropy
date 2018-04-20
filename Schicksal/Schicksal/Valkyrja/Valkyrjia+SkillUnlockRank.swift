//
//  Valkyrjia+SkillUnlockRank.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-20.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public typealias ValkyrjaRank = SkillUnlockRank

public enum SkillUnlockRank: Int, Codable {
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

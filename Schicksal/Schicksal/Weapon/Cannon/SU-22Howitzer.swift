//
//  SU-22Howitzer.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-5-2.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public struct SU_22Howitzer: Weapon {
    public let code: WeaponCode = .SU_22Howitzer

    public let type: WeaponType = .cannon
    public let rarity: [Rarity] = [.S1, .S2]

    public var currentRarity: Rarity

    public var ATK: ATK {
        switch currentRarity {
        case .S1: return 42
        default:  return 76
        }
    }

    public var CRT: CRT {
        switch currentRarity {
        case .S1: return 4
        default:  return 8
        }
    }

    public let weaponSkills: [WeaponSkill] = []

    public init(currentRarity: Rarity = .S1) {
        self.currentRarity = currentRarity
    }
}

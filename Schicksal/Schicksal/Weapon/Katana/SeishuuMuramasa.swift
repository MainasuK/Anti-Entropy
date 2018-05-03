//
//  SeishuuMuramasa.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-5-2.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public struct SeishuuMuramasa: Weapon {
    public static let code: WeaponCode = .SeishuuMuramasa

    public static let caption: String = "SeishuuMuramasa"

    public static let type: WeaponType = .katana
    public static let rarity: [Rarity] = [.S1, .S2]

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

//
//  WeaponModel.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-5-2.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

@objc public enum WeaponCode: Int {
    case USP45

    case SeishuuMuramasa

    case SU_22Howitzer
}

public struct WeaponModel {
    public static func clone(from code: WeaponCode, of rarity: Rarity) -> Weapon {
        switch code {
        case .USP45:            return USP45(currentRarity: rarity)
        case .SeishuuMuramasa:  return SeishuuMuramasa(currentRarity: rarity)
        case .SU_22Howitzer:    return SU_22Howitzer(currentRarity: rarity)
        }
    }
}

extension WeaponModel {
    public static var allWeaponType: [Weapon.Type] {
        return [USP45.self, SeishuuMuramasa.self, SU_22Howitzer.self]
    }
}

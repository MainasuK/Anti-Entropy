//
//  Weapon.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-16.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public protocol Weapon: Measurable {
    var code: WeaponCode { get }

    var type: WeaponType { get }
    var rarity: [Rarity] { get }

    var currentRarity: Rarity { get set }

    var ATK: ATK { get }
    var CRT: CRT { get }

    var weaponSkills: [WeaponSkill] { get }
}

public protocol WeaponSkill: WeaponSkillBase {

}

//public struct ValkyrjaModel {
//    public static func clone(from code: ValkyrjaCode, with basicStatus: BasicStatus = BasicStatus(), rank: ValkyrjaRank = .SSS) -> Valkyrja {
//        switch code {
//        case .whiteComet:       return V_WhiteComet(basicStatus: basicStatus, rank: rank)
//        case .valkyrieChariot:  return V_ValkyrieChariot(basicStatus: basicStatus, rank: rank)
//        case .crimsonImpulse:   return V_CrimsonImpulse(basicStatus: basicStatus, rank: rank)
//        }
//    }
//}

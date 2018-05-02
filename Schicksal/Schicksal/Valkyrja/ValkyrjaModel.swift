//
//  ValkyrjaModel.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-5-2.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

@objc public enum ValkyrjaCode: Int {
    case whiteComet
    case valkyrieChariot
    case crimsonImpulse
}

public struct ValkyrjaModel {
    public static func clone(from code: ValkyrjaCode,
                             with basicStatus: BasicStatus = BasicStatus(),
                             rank: ValkyrjaRank = .SSS,
                             weapon: Weapon) -> Valkyrja {
        switch code {
        case .whiteComet:       return V_WhiteComet(basicStatus: basicStatus, rank: rank, weapon: weapon)
        case .valkyrieChariot:  return V_ValkyrieChariot(basicStatus: basicStatus, rank: rank, weapon: weapon)
        case .crimsonImpulse:   return V_CrimsonImpulse(basicStatus: basicStatus, rank: rank, weapon: weapon)
        }
    }
}

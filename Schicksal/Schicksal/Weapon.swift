//
//  Weapon.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-16.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

@objc public enum WeaponCode: Int {
    case USP45
}

public enum WeaponType: String {
    case pistol
    case katana

    // ref: http://dq.tieba.com/p/5515146022
    // ref: https://forum.gamer.com.tw/C.php?bsn=31066&snA=3814
    // 蓄力炮 倍率：          点射       一蓄      二蓄      三蓄
    // 通用                  50%       140%     300%      640%
    // 通用基础上按类型乘算
    case lightCannon             // 速射炮     70%（乘算）
    case cannon                  // 火炮        -
    case heavyCannon             // 重炮      150%（乘算）
    case superHaveryCannon       // 超重炮    200%（乘算）

    // 导弹 倍率：            点射        一蓄      二蓄      三蓄
    // 制导导弹（2/5/11)      50%       170%     380%      800%
    // 多重制导（3/7/15）     50%       240%     520%      1080%
    case clusterMissiles         // 制导导弹
    case multipleClusterMissiles // 多重制导

    // 霰弹 倍率：            点射        一蓄      二蓄      三蓄
    // 制导导弹（3/6/14)      50%       150%     360%      1120%
    // 多重指导（4/9/19）     50%       200%     540%      1520%
    case shotgun                 // 霰弹

    // 激光 倍率:
    case laser                   // 激光

    // TODO:
//    case fuxiThunder           // 伏羲
//    case fuxiFire
//    case fuxiIce

    case claymore
    case cross
    case glove

    var isCannon: Bool {
        switch self {
        case .lightCannon, .cannon, .heavyCannon, .superHaveryCannon: return true
        default:                                                      return false
        }
    }

    var isMissiles: Bool {
        switch self {
        case .clusterMissiles, .multipleClusterMissiles: return true
        default:                                         return false
        }
    }
}

public protocol Weapon: Attackable {
    var ATK: ATK { get }
    var CRT: CRT { get }

    var type: WeaponType { get }
}

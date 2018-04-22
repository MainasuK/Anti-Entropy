//
//  S_JixuanyuanAqua_T.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-16.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

struct S_JixuanyuanAqua_T: Stigmata {

    let tag: StigmataTag = "Jixuanyuan Aqua"
    let slot: StigmataSlot = .T
    let rarity: [Rarity] = [.S3, .S4]

    var currentRarity: Rarity

    var HP: HP {
        switch currentRarity {
        case .S3: return 221
        default:  return 325
        }
    }

    var ATK: ATK {
        switch currentRarity {
        case .S3: return 36
        default:  return 54
        }
    }

    var CRT: CRT {
        return 0
    }

    var DEF: DEF {
        switch currentRarity {
        case .S3: return 25
        default:  return 37
        }
    }

}

extension S_JixuanyuanAqua_T {

//    var caption: String {
//        switch currentLv {
//        case .twentyFive: "Jixuanyuan Aqua"
//        default:          ""
//        }
//    }
//
    
}

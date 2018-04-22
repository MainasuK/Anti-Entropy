//
//  S_JixuanyuanAqua_B.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-16.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

struct S_JixuanyuanAqua_B: Stigmata {

    let tag: StigmataTag = "Jixuanyuan Aqua"
    let slot: StigmataSlot = .T
    let rarity: [Rarity] = [.S3, .S4]
//    var skillExplainable: [Explainable] {
//        switch currentLv {
//        case .twentyFive: return [S_JixuanyuanAqua_B_Skill_Explainable_25()]
//        default:          return [S_JixuanyuanAqua_B_Skill_Explainable_35()]
//        }
//    }
//    let twoSetsSkillExplainable: Explainable = S_JixuanyuanAqua_2Sets_Skill_Explainable()
//    let threeSetsSkillExplainable: Explainable = S_JixuanyuanAqua_3Sets_Skill_Explainable()

    var currentRarity: Rarity

    var HP: HP {
        switch currentRarity {
        case .S3: return 221
        default:  return 325
        }
    }

    var ATK: ATK {
        switch currentRarity {
        case .S3: return 18
        default:  return 27
        }
    }

    var CRT: CRT {
        switch currentRarity {
        case .S3: return 2
        default:  return 3
        }
    }

    var DEF: DEF {
        switch currentRarity {
        case .S3: return 25
        default:  return 37
        }
    }

}

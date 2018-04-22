//
//  S_JixuanyuanAqua_C.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-16.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

struct S_JixuanyuanAqua_C: Stigmata {
    let tag: StigmataTag = "Jixuanyuan Aqua"
    let slot: StigmataSlot = .C
    let rarity: [Rarity] = [.S3, .S4]
//    var skillExplainable: [Explainable] {
//        switch currentLv {
//        case .twentyFive: return [S_JixuanyuanAqua_C_Skill_Explainable_25()]
//        default:          return [S_JixuanyuanAqua_C_Skill_Explainable_35()]
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
        return 0
    }

    var CRT: CRT {
        switch currentRarity {
        case .S3: return 4
        default:  return 6
        }
    }

    var DEF: DEF {
        switch currentRarity {
        case .S3: return 25
        default:  return 37
        }
    }

}

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
    let position: StigmataPosition = .C
    let starRank: StarRank = 3
    let lvRank: [StigmataLv] = [.twentyFive, .thirtyFive]
//    var skillExplainable: [Explainable] {
//        switch currentLv {
//        case .twentyFive: return [S_JixuanyuanAqua_C_Skill_Explainable_25()]
//        default:          return [S_JixuanyuanAqua_C_Skill_Explainable_35()]
//        }
//    }
//    let twoSetsSkillExplainable: Explainable = S_JixuanyuanAqua_2Sets_Skill_Explainable()
//    let threeSetsSkillExplainable: Explainable = S_JixuanyuanAqua_3Sets_Skill_Explainable()

    var currentLv: StigmataLv

    var HP: HP {
        switch currentLv {
        case .twentyFive: return 221
        default:          return 325
        }
    }

    var ATK: ATK {
        return 0
    }

    var CRT: CRT {
        switch currentLv {
        case .twentyFive: return 4
        default:          return 6
        }
    }

    var DEF: DEF {
        switch currentLv {
        case .twentyFive: return 25
        default:          return 37
        }
    }

}

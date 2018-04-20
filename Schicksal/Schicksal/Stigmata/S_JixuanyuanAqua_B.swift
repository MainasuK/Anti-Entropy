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
    let position: StigmataPosition = .T
    let starRank: StarRank = 3
    let lvRank: [StigmataLv] = [.twentyFive, .thirtyFive]
//    var skillExplainable: [Explainable] {
//        switch currentLv {
//        case .twentyFive: return [S_JixuanyuanAqua_B_Skill_Explainable_25()]
//        default:          return [S_JixuanyuanAqua_B_Skill_Explainable_35()]
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
        switch currentLv {
        case .twentyFive: return 18
        default:          return 27
        }
    }

    var CRT: CRT {
        switch currentLv {
        case .twentyFive: return 2
        default:          return 3
        }
    }

    var DEF: DEF {
        switch currentLv {
        case .twentyFive: return 25
        default:          return 37
        }
    }

}

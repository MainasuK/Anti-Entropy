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
    let position: StigmataPosition = .T
    let starRank: StarRank = 3
    let lvRank: [StigmataLv] = [.twentyFive, .thirtyFive]
    let explanation: Explanation = S_JixuanyuanAqua_Explanation()
    var skillExplanation: [Explanation] {
        switch currentLv {
        case .twentyFive: return [S_JixuanyuanAqua_T_Skill_Explanation_25()]
        default:          return [S_JixuanyuanAqua_T_Skill_Explanation_35()]
        }
    }

    let twoSetsSkillExplanation: Explanation = S_JixuanyuanAqua_2Sets_Skill_Explanation()
    let threeSetsSkillExplanation: Explanation = S_JixuanyuanAqua_3Sets_Skill_Explanation()

    var currentLv: StigmataLv

    var HP: HP {
        switch currentLv {
        case .twentyFive: return 221
        default:          return 325
        }
    }

    var ATK: ATK {
        switch currentLv {
        case .twentyFive: return 36
        default:          return 54
        }
    }

    var CRT: CRT {
        return 0
    }

    var DEF: DEF {
        switch currentLv {
        case .twentyFive: return 25
        default:          return 37
        }
    }

}

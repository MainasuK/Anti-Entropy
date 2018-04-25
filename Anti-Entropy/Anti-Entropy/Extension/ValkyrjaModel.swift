//
//  ValkyrjaModel.swift
//  Anti-Entropy
//
//  Created by Cirno MainasuK on 2018-4-25.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation
import RealmSwift
import Schicksal

extension ValkyrjaModel {
    static func clone(from intelligence: ValkyrjaIntelligence) -> Valkyrja {
        let basicStatus = BasicStatus(HP: intelligence.HP,
                                      SP: intelligence.SP,
                                      ATK: intelligence.ATK,
                                      DEF: intelligence.DEF,
                                      CRT: intelligence.CRT,
                                      LV: intelligence.LV)
        let valkyrja = ValkyrjaModel.clone(from: intelligence.valkyrjaCode, with: basicStatus, rank: intelligence.rank)

        // TODO: weaon & stigmata

        return valkyrja
    }
}

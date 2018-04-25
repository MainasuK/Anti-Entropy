//
//  V_WhiteComet.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-16.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public struct V_WhiteComet: Valkyrja {
    public let code: ValkyrjaCode  = .whiteComet
    
    public let firstname: String   = "V_WhiteComet_Firstname"
    public let lastname: String    = "V_WhiteComet_Lastname"
    public let shortName: String   = "V_WhiteComet_ShortName"
    public let fullName: String    = "V_WhiteComet_FullName"
    public let description: String = "V_WhiteComet_Description"

    public let localizeTableName: String? = "Localizable_V_WhiteComet"

    public let initialRank: ValkyrjaRank = .none

    public let skills: Skills = [SKS_WhiteComet_SpecialAttack(),
                                 SKS_WhiteComet_Ultimate(),
                                 SKS_WhiteComet_BasicAttack(),
                                 SKS_WhiteComet_Evasion(),
                                 SKS_WhiteComet_PassiveSkill(),
                                 SKS_WhiteComet_LeaderSkill()]

    public var basicStatus: BasicStatus
    public var rank: ValkyrjaRank

    public init(basicStatus: BasicStatus = BasicStatus(), rank: ValkyrjaRank = .SSS) {
        self.basicStatus = basicStatus
        self.rank = rank
    }

}



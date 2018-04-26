//
//  V_ValkyrieChariot.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-26.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public struct V_ValkyrieChariot: Valkyrja {
    public let code: ValkyrjaCode  = .valkyrieChariot

    public let firstname: String   = "V_ValkyrieChariot_Firstname"
    public let lastname: String    = "V_ValkyrieChariot_Lastname"
    public let shortName: String   = "V_ValkyrieChariot_ShortName"
    public let fullName: String    = "V_ValkyrieChariot_FullName"
    public let description: String = "V_ValkyrieChariot_Description"

    public let localizeTableName: String? =  "Localizable_V_ValkyrieChariot"

    public let initialRank: ValkyrjaRank = .none

    public let skills: Skills = [SKS_ValkyrieChariot_SpecialAttack(),
                                 SKS_ValkyrieChariot_Ultimate(),
                                 SKS_ValkyrieChariot_BasicAttack()]

    public var basicStatus: BasicStatus
    public var rank: ValkyrjaRank

    public init(basicStatus: BasicStatus = BasicStatus(), rank: ValkyrjaRank = .SSS) {
        self.basicStatus = basicStatus
        self.rank = rank
    }

}

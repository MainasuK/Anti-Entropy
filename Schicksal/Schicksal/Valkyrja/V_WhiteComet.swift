//
//  V_WhiteComet.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-16.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

struct Nickname_WhiteComet: Explanation {
    var caption_EN: String = "White Comet"
    var content_EN: String = ""

    var caption_CN: String = ""
    var content_CN: String = ""

    var caption_JP: String = ""
    var content_JP: String = ""
}

struct Characteristics_WhiteComet: Explanation {
    var caption_EN: String = ""
    var content_EN: String = """
        Melee attacker with constant DPS.
        Good at interrupting enemy attacks.
        High survivability.
        """
    var caption_CN: String = ""
    var content_CN: String = ""

    var caption_JP: String = ""
    var content_JP: String = ""
}

public struct V_WhiteComet: Valkyrja {
    
    public let nickname: Explanation = Nickname_WhiteComet()
    public let realname: Explanation = KianaKaslana()
    public let characteristics: Explanation = Characteristics_WhiteComet()
    public let property: Property = .mecha

    public var lv: LV
    public var basicStatus: BasicStatus

    public var weapon: Weapon
    public var stigmataSuit: StigmataSuit
    public var skills: Skills

    init(lv: LV, basicStatus: BasicStatus, weapon: Weapon, stigmataSuit: StigmataSuit, skills: Skills) {
        self.lv = lv
        self.basicStatus = basicStatus
        self.weapon = weapon
        self.stigmataSuit = stigmataSuit
        self.skills = skills
    }

}



//
//  Valkyrjia+MainSkill.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-20.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public protocol MainSkill: SkillBase {
    var mainSubskills: [MainSubskill] { get }
}

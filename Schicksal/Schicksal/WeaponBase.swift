//
//  WeaponBase.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-5-2.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public protocol SchicksalBase: Measurable, Attackable, Explainable {
    var attackTag: AttackTag { get }
}

public protocol WeaponSkillBase: SchicksalBase {

}

public protocol StigmataSkillBase: SchicksalBase {
    
}

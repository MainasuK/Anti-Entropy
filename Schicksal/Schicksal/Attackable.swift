//
//  Attackable.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-22.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public protocol Attackable: Measurable {

    var meleePhysicalDamageTransform: Percentage { get }
    var rangedPhysicalDamageTransform: Percentage { get }

    var thunderDamageTransform: Percentage { get }
    var fireDamageTransform: Percentage { get }
    var iceDamageTransform: Percentage { get }

    func totalDamage() -> (([Measurable]) -> DMG)

}

//
//  Weapon.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-16.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

@objc public enum WeaponCode: Int {
    case USP45
}

public enum WeaponType: String {
    case pistol
    case katana
    case cannon
    case claymore
    case cross
    case glove
}

public protocol Weapon: Measurable {
    var ATK: ATK { get }
    var CRT: CRT { get }
}

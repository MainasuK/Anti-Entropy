//
//  Weapon.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-16.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public protocol Weapon: Measurable {
    var ATK: ATK { get }
    var CRT: CRT { get }
}

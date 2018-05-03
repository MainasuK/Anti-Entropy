//
//  Weapon.swift
//  Anti-Entropy
//
//  Created by Cirno MainasuK on 2018-5-3.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation
import Schicksal

extension Weapon {
    static var attributedString: NSAttributedString {
        let name = Self.caption.localized(using: Self.localizeTableName, in: schicksalBundle)
        return NSAttributedString(string: name, attributes: [.foregroundColor : UIColor.white])
    }
}

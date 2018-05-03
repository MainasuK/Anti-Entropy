//
//  UIToolbar.swift
//  Anti-Entropy
//
//  Created by Cirno MainasuK on 2018-5-3.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import UIKit

extension UIToolbar {
    static func doneToolbar(target: Any?, action: Selector?) -> UIToolbar {
        let toolbar = UIToolbar(frame: .zero)
        let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let done = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: target, action: action)

        toolbar.barStyle = .blackTranslucent
        toolbar.items = [space, done]
        toolbar.sizeToFit()

        return toolbar
    }
}

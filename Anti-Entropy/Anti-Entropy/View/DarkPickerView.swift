//
//  DarkPickerView.swift
//  Anti-Entropy
//
//  Created by Cirno MainasuK on 2018-5-2.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import UIKit

class DarkPickerView: UIPickerView {

    override func layoutSubviews() {
        super.layoutSubviews()

        for line in subviews where line.bounds.height <= 1.0 {
            line.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        }

        backgroundColor = .clear
    }

}

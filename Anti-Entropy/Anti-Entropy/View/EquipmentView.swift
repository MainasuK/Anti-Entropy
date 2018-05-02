//
//  EquipmentView.swift
//  Anti-Entropy
//
//  Created by Cirno MainasuK on 2018-5-2.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import UIKit

class EquipmentView: UIView {

    private let valkyrjiaPickerView      = DarkPickerView()
    private let weaponPickerView         = DarkPickerView()
    private let stigmataTopPickerView    = DarkPickerView()
    private let stigmataCenterPickerView = DarkPickerView()
    private let stigmataBottomPickerView = DarkPickerView()

    private let accessoryToolBar: UIToolbar = {
        let toolbar = UIToolbar(frame: .zero)
        let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let done = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(doneButtonPressed(_:)))

        toolbar.barStyle = .blackTranslucent
        toolbar.items = [space, done]
        toolbar.sizeToFit()

        return toolbar
    }()

    @IBOutlet var textFields: [UITextField]! {
        didSet {
            textFields.forEach {
                $0.keyboardType = .numberPad
                $0.inputAccessoryView = accessoryToolBar
                $0.keyboardAppearance = .dark
                $0.backgroundColor = UIColor.white.withAlphaComponent(0.7)
                $0.tintColor = .clear
                //                $0.delegate = self
            }
        }
    }

    @IBOutlet weak var valkyrjiaTextField: UITextField! {
        didSet {
            valkyrjiaTextField.inputView = valkyrjiaPickerView
        }
    }

    @IBOutlet weak var weaponTextField: UITextField! {
        didSet {
            weaponTextField.inputView = weaponPickerView
        }
    }
    @IBOutlet weak var topTextField: UITextField! {
        didSet {
            topTextField.inputView = stigmataTopPickerView
        }
    }
    @IBOutlet weak var centerTextField: UITextField! {
        didSet {
            centerTextField.inputView = stigmataCenterPickerView
        }
    }
    @IBOutlet weak var buttonTextField: UITextField! {
        didSet {
            buttonTextField.inputView = stigmataBottomPickerView
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        _init()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        _init()
    }

    private func _init() {
        fromNib()
    }

}

extension EquipmentView {

    @objc func doneButtonPressed(_ sender: UIBarButtonItem) {
        endEditing(true)
    }

}

//
//  BasicStatusView.swift
//  Anti-Entropy
//
//  Created by Cirno MainasuK on 2018-4-17.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import UIKit
import RxCocoa

protocol BasicStatusViewDelegate: class {
    func presentPresetTeamViewController()
}

class BasicStatusView: UIView {

    weak var delegate: BasicStatusViewDelegate?

    private let lvPickerView = DarkPickerView()
    private let valkyrjiaPickerView = DarkPickerView()
    private let accessoryToolBar: UIToolbar = {
        let toolbar = UIToolbar(frame: .zero)
        let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let done = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(doneButtonPressed(_:)))

        toolbar.barStyle = .blackTranslucent
        toolbar.items = [space, done]
        toolbar.sizeToFit()

        return toolbar
    }()

    @IBAction func teamButtonPressed(_ sender: UIButton) {
        delegate?.presentPresetTeamViewController()
    }

    @IBAction func valkyrjiaTextFieldLongPressed(_ sender: UILongPressGestureRecognizer) {
        delegate?.presentPresetTeamViewController()
    }

    @IBOutlet var textFields: [UITextField]! {
        didSet {
            textFields.forEach {
                $0.keyboardType = .numberPad
                $0.inputAccessoryView = accessoryToolBar
                $0.keyboardAppearance = .dark
                $0.backgroundColor = UIColor.white.withAlphaComponent(0.7)
                $0.tintColor = .red
                $0.delegate = self
            }
        }
    }

    @IBOutlet weak var lvTextField: UITextField! {
        didSet {
            lvTextField.inputView = lvPickerView
            lvTextField.tintColor = .clear
        }
    }
    @IBOutlet weak var valkyrjiaTextField: UITextField! {
        didSet {
            valkyrjiaTextField.inputView = valkyrjiaPickerView
            valkyrjiaTextField.tintColor = .clear
        }
    }
    @IBOutlet weak var hpTextField: UITextField!
    @IBOutlet weak var spTextField: UITextField!
    @IBOutlet weak var atkTextField: UITextField!
    @IBOutlet weak var defTextField: UITextField!
    @IBOutlet weak var crtTextField: UITextField!

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

private let lvRange = Array(1...80).map { "\($0)" }

// MARK: - UITextFieldDelegate
extension BasicStatusView: UITextFieldDelegate {

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField === lvTextField {
            lvRange.index(of: textField.text ?? "1").flatMap { lvPickerView.selectRow($0, inComponent: 0, animated: false) }
        }

        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: string)) else {
            return false
        }

        guard let text = textField.text, let value = Int(text + string), value < 65536 else {
            return false
        }

        guard (text + string).count < 6 else {
            return false
        }

        return true
    }

}

extension BasicStatusView {

    @objc func doneButtonPressed(_ sender: UIBarButtonItem) {
        endEditing(true)
    }

}

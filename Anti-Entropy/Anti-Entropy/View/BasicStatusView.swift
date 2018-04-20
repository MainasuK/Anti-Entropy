//
//  BasicStatusView.swift
//  Anti-Entropy
//
//  Created by Cirno MainasuK on 2018-4-17.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import UIKit
import RxCocoa

class DarkPickerView: UIPickerView {

    override func layoutSubviews() {
        super.layoutSubviews()

        for line in subviews where line.bounds.height <= 1.0 {
            line.backgroundColor = UIColor.white.withAlphaComponent(0.3)
        }

        backgroundColor = .clear
    }

}

class BasicStatusView: UIView {

    private let pickerView = DarkPickerView()
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
                $0.tintColor = UIColor.red
                $0.delegate = self
            }
        }
    }

    @IBOutlet weak var lvTextField: UITextField! {
        didSet {
            pickerView.delegate = self
            pickerView.dataSource = self

            lvTextField.inputView = pickerView
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

// MARK: - UITextFieldDelegate
extension BasicStatusView: UITextFieldDelegate {

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField === lvTextField {
            lvRange.index(of: textField.text ?? "1").flatMap { pickerView.selectRow($0, inComponent: 0, animated: false) }
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

private let lvRange = Array(1...80).map { "\($0)" }

// MARK: - UIPickerViewDelegate
extension BasicStatusView: UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lvTextField.text = lvRange[row]
    }

    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let text = lvRange[row]
        return NSAttributedString(string: text, attributes: [.foregroundColor : UIColor.white])
    }

}

// MARK: - UIPickerViewDataSource
extension BasicStatusView: UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return lvRange.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return lvRange[row]
    }

}

extension BasicStatusView {

    @objc func doneButtonPressed(_ sender: UIBarButtonItem) {
        endEditing(true)
    }

}

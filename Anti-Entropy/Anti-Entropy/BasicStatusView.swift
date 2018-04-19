//
//  BasicStatusView.swift
//  Anti-Entropy
//
//  Created by Cirno MainasuK on 2018-4-17.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import UIKit

class BasicStatusView: UIView {

    let accessoryToolBar: UIToolbar = {
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

    @IBOutlet weak var lvTextField: UITextField!
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

    override func awakeFromNib() {
        super.awakeFromNib()
        fromNib()
        print("awakeFromNib")
    }

}

// MARK: - UITextFieldDelegate
extension BasicStatusView: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: string))
    }

}

extension BasicStatusView {

    @objc func doneButtonPressed(_ sender: UIBarButtonItem) {
        endEditing(true)
    }

}

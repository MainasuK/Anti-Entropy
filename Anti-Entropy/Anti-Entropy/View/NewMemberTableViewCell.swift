//
//  NewMemberTableViewCell.swift
//  Anti-Entropy
//
//  Created by Cirno MainasuK on 2018-5-3.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import UIKit

class NewMemberTableViewCell: UITableViewCell {

    private var accessoryToolBar: UIToolbar!

    private let valkyrjiaPickerView = DarkPickerView()

    @IBOutlet weak var textField: UITextField! {
        didSet {
            textField.keyboardAppearance = .dark
            textField.backgroundColor = UIColor.white.withAlphaComponent(0.7)
            textField.inputView = valkyrjiaPickerView
            textField.tintColor = .clear
        }
    }

    override func prepareForReuse() {
        if let pickerView = textField.inputView as? UIPickerView {
            pickerView.dataSource = nil
            pickerView.delegate = nil
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

        accessoryToolBar = UIToolbar.doneToolbar(target: self, action: #selector(doneButtonPressed(_:)))
        textField.inputAccessoryView = accessoryToolBar
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension NewMemberTableViewCell {
    @objc func doneButtonPressed(_ sender: UIBarButtonItem) {
        endEditing(true)
    }
}

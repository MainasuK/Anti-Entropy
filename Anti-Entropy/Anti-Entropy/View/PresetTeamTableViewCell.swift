//
//  PresetTeamTableViewCell.swift
//  Anti-Entropy
//
//  Created by Cirno MainasuK on 2018-5-3.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import UIKit

class PresetTeamTableViewCell: UITableViewCell {

    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamNameTextField: UITextField! {
        didSet {
            teamNameTextField.keyboardAppearance = .dark
            teamNameTextField.backgroundColor = UIColor.white.withAlphaComponent(0.7)
            teamNameTextField.tintColor = .red
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

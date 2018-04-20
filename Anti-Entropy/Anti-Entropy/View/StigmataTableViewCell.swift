//
//  StigmataTableViewCell.swift
//  Anti-Entropy
//
//  Created by Cirno MainasuK on 2018-4-16.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import UIKit
import Schicksal

class StigmataTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension StigmataTableViewCell {

    func configure(with stigmata: Stigmata) {
        nameLabel.text  = stigmata.name
        levelLabel.text = "Lv.\(stigmata.currentLv.rawValue)"
    }
    
}

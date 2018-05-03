//
//  PresetTeamAddMemberTableViewCell.swift
//  Anti-Entropy
//
//  Created by Cirno MainasuK on 2018-5-3.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import UIKit

protocol PresetTeamAddMemberTableViewCellDelegate: class {
    func addButtonPressed(_ sender: UIButton)
}

class PresetTeamAddMemberTableViewCell: UITableViewCell {

    weak var delegate: PresetTeamAddMemberTableViewCellDelegate?

    @IBOutlet weak var addButton: UIButton! {
        didSet {
            let image = #imageLiteral(resourceName: "add").withRenderingMode(.alwaysTemplate)
            addButton.setImage(image, for: .normal)
        }
    }

    @IBAction func addButtonPressed(_ sender: UIButton) {
        delegate?.addButtonPressed(sender)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension UIButton {

    func setBackgroundColor(color: UIColor, for state: UIControlState) {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIGraphicsGetCurrentContext()!.setFillColor(color.cgColor)
        UIGraphicsGetCurrentContext()!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let colorImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        setBackgroundImage(colorImage, for: state)
    }

}

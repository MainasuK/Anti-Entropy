//
//  CalculatorTableViewCell.swift
//  Anti-Entropy
//
//  Created by Cirno MainasuK on 2018-4-18.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import UIKit
import Schicksal
import RxSwift
import RxCocoa

let valkyrjaRank: SkillUnlockRank = .none

class CalculatorTableViewCell: UITableViewCell {

    enum CalculatorTableViewCellType {
        case mainSkill
        case mainSubskill
        case subskill
    }

    private let disposeBag = DisposeBag()

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!

    // TODO: use [valkyrja] & [Stigma] & [Weapon] instead
    var measurables = V_WhiteComet().measurables
    let determination: Determination = {
        let abilityState: AbilityState = .shielded
        return Determination(attackable: nil, attackTag: .none, abilityState: abilityState)
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension CalculatorTableViewCell {

    func configure(with attackable: Attackable, for type: CalculatorTableViewCellType) {

    }

    private func configure(with mainSkill: MainSkill) {

    }

    func configure(with skill: Skill, of basicStatus: BasicStatus, at indexPath: IndexPath) {
        self.configure(with: skill.mainSkill, sub: skill.subSkills, of: basicStatus, at: indexPath.row)
    }

    private func configure(with main: MainSkill, sub: SubSkills, of basicStatus: BasicStatus, at row: Int) {
        let mainSubskillRange = 1..<(1 + main.mainSubskills.count)
        let subSkillRange     = mainSubskillRange.upperBound..<(mainSubskillRange.upperBound + sub.count)
//        let buff              = skills.map { $0.skillTypes }
//                                      .flatMap { $0 }
//                                      .filter { $0.skillType == .buff }
//                                      .filter { valkyrjaRank.rawValue >= $0.skillUnlockRank.rawValue }

        switch row {
        case 0:
            label.text         = main.localized.caption
            typeLabel.text     = main.attackTag.localized.caption
            subtitleLabel.text = main.localized.content
            detailLabel.text   = {
                let damage = main.mainSubskills
                    .map { $0.attack(with: basicStatus, with: measurables, under: determination) }
                    .reduce(0.0, +)
                return (damage > 0.0) ? "\(damage)" : "--"
            }()
//            let hasNoBuffSkill = !main.mainSubskills.filter { $0.skillType != .buff && $0.skillType != .debuff }.isEmpty
//            detailLabel.text   = (hasNoBuffSkill) ?
//                                 "\(main.mainSubskills.map { basicStatus.DMG(for: [$0], with: [:], with: buff) }.reduce(0, +))" : "--"
        case _ where mainSubskillRange ~= row:
            let mainSubskill   = main.mainSubskills[row - 1]
            label.text         = main.localized.caption + " - " + mainSubskill.localized.caption
            typeLabel.text     = mainSubskill.attackTag.localized.caption
            subtitleLabel.text = mainSubskill.localized.content
            detailLabel.text   = {
                let damage = mainSubskill.attack(with: basicStatus, with: measurables, under: determination)
                return (damage > 0.0) ? "\(damage)" : "--"
            }()

//            detailLabel.text   = (mainSubskill.skillType == .buff || mainSubskill.skillType == .debuff) ?
//                                 "--" : "\(basicStatus.DMG(for: [mainSubskill], with: [:], with: buff))"
        case _ where subSkillRange ~= row:
            let subskill       = sub[row - mainSubskillRange.upperBound]
            label.text         = subskill.localized.caption
            typeLabel.text     = [subskill.attackTag.localized.caption, subskill.skillUnlockRank.text]
                .compactMap { $0 }.filter { !$0.isEmpty }.joined(separator: "·")
            subtitleLabel.text = subskill.localized.content
            detailLabel.text   = {
                let damage = subskill.attack(with: basicStatus, with: measurables, under: determination)
                return (damage > 0.0) ? "\(damage)" : "--"
            }()

//            detailLabel.text   = (subskill.skillType == .buff || subskill.skillType == .debuff) ?
//                                 "--" : "\(basicStatus.DMG(for: [subskill], with: [:], with: buff))"
        default:
            assertionFailure()
        }
    }

}

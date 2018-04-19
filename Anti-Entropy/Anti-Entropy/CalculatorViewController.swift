//
//  CalculatorViewController.swift
//  Anti-Entropy
//
//  Created by Cirno MainasuK on 2018-4-17.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import UIKit
import Schicksal

class CalculatorViewController: UIViewController {

    var basicStatus = BasicStatus(HP: 697, SP: 104, ATK: 100, DEF: 46, CRT: 11)

    // All buff damage - 1 sections (0)
    var damage = [Measurable]()

    // All skill - 6 sections (1 - 6)
    var skills = [SKS_WhiteComet_SpecialAttack, SKS_WhiteComet_Ultimate, SKS_WhiteComet_BasicAttack,
                  SKS_WhiteComet_Evasion, SKS_WhiteComet_PassiveSkill, SKS_WhiteComet_LeaderSkill]

    lazy var basicStatusView = BasicStatusView()
    lazy var basicStatusView2 = BasicStatusView()

    @IBOutlet weak var topPagingScrollView: UIScrollView!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.contentInset.top = 160.0
            tableView.scrollIndicatorInsets.top = 160.0
            tableView.backgroundColor = .black
            tableView.insetsContentViewsToSafeArea = true
            tableView.tableHeaderView = UIView()
            tableView.tableFooterView = UIView()
            tableView.delegate = self
            tableView.dataSource = self
        }
    }

}

// MARK: View Life Cycle
extension CalculatorViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        basicStatusView.lvTextField.text  = "80"
        basicStatusView.hpTextField.text  = "697"
        basicStatusView.spTextField.text  = "104"
        basicStatusView.atkTextField.text = "100"
        basicStatusView.defTextField.text = "46"
        basicStatusView.crtTextField.text = "11"

        setupTopPagingScrollView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

    }

}

extension CalculatorViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

extension CalculatorViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 + 6
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:                         return damage.count
        case _ where 1...6 ~= section:  return skills[section-1].count
        default:                        return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CalculatorTableViewCell", for: indexPath) as! CalculatorTableViewCell

        switch indexPath.section {
        case 0:
            break
        case _ where 1...6 ~= indexPath.section:
            let skill = skills[indexPath.section - 1]
            cell.configure(with: skill, of: basicStatus, at: indexPath)
        default:
            break
        }

        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let skillsRange = 1..<(1 + skills.count)

        switch section {
        case 0:
            return nil
        case _ where skillsRange ~= section:
            return skills[section - 1].text
        default:
            assertionFailure()
            return nil
        }
    }

}

extension CalculatorViewController {

    func setupTopPagingScrollView() {
        topPagingScrollView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 160.0)
        topPagingScrollView.contentSize.width = view.bounds.width * 2
        topPagingScrollView.contentSize.height = 160.0
        topPagingScrollView.isPagingEnabled = true

        // margin left & right
        let effectViewFrame = CGRect(x: -view.bounds.width, y: 0,
                                     width: topPagingScrollView.contentSize.width * 2, height: topPagingScrollView.bounds.height)

        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = effectViewFrame
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.backgroundColor = UIColor.white.withAlphaComponent(0.6)

        let vibrancyEffect = UIVibrancyEffect(blurEffect: blurEffect)
        let vibrancyEffectView = UIVisualEffectView(effect: vibrancyEffect)
        vibrancyEffectView.frame = blurEffectView.bounds

        topPagingScrollView.addSubview(blurEffectView)
        blurEffectView.contentView.addSubview(vibrancyEffectView)

        basicStatusView.frame = topPagingScrollView.bounds
        basicStatusView2.frame = topPagingScrollView.bounds
        basicStatusView.frame.origin.x = topPagingScrollView.bounds.width
        basicStatusView2.frame.origin.x = topPagingScrollView.bounds.width * 2

        vibrancyEffectView.contentView.addSubview(basicStatusView)
        vibrancyEffectView.contentView.addSubview(basicStatusView2)
    }
}

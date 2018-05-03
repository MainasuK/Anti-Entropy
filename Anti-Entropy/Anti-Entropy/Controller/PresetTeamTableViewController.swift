//
//  PresetTeamTableViewController.swift
//  Anti-Entropy
//
//  Created by Cirno MainasuK on 2018-5-3.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import UIKit

class PresetTeamTableViewController: UITableViewController {

    var viewModel = PresetTeamViewModel()

    @IBAction func barButtonItemPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let nibTeamName = UINib(nibName: "PresetTeamTableViewCell", bundle: nil)
        tableView.register(nibTeamName, forCellReuseIdentifier: "PresetTeamTableViewCell")

        let nibMeasurable = UINib(nibName: "PresetTeamMeasurableTableViewCell", bundle: nil)
        tableView.register(nibMeasurable, forCellReuseIdentifier: "PresetTeamMeasurableTableViewCell")

        let nibAddButton = UINib(nibName: "PresetTeamAddMemberTableViewCell", bundle: nil)
        tableView.register(nibAddButton, forCellReuseIdentifier: "PresetTeamAddMemberTableViewCell")

        tableView.backgroundColor              = .black
        tableView.indicatorStyle               = .white
        tableView.insetsContentViewsToSafeArea = true
        tableView.tableHeaderView              = UIView()
        tableView.tableFooterView              = UIView()
    }

}

// MARK: - UITableViewDelegate
extension PresetTeamTableViewController {

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return (viewModel.numberOfRows(in: section) == 0) ? CGFloat.leastNonzeroMagnitude : 22.0
    }

    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return (viewModel.numberOfRows(in: section) == 0) ? CGFloat.leastNonzeroMagnitude : 22.0
    }

}

// MARK: - UITableViewDataSource
extension PresetTeamTableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PresetTeamTableViewCell", for: indexPath) as! PresetTeamTableViewCell
            viewModel.configure(cell, at: indexPath)
            return cell

        case 1...4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PresetTeamMeasurableTableViewCell", for: indexPath) as! PresetTeamMeasurableTableViewCell
            viewModel.configure(cell, at: indexPath)
            return cell

        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PresetTeamAddMemberTableViewCell", for: indexPath) as! PresetTeamAddMemberTableViewCell
            cell.delegate = self
            return cell
        default:
            assertionFailure()
            return UITableViewCell()
        }
    }

}

// MARK: - PresetTeamAddMemberTableViewCellDelegate
extension PresetTeamTableViewController: PresetTeamAddMemberTableViewCellDelegate {
    func addButtonPressed(_ sender: UIButton) {
        let navigationController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewMemberNavigationViewController")
        present(navigationController, animated: true, completion: nil)
    }
}

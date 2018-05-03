//
//  NewMemberTableViewController.swift
//  Anti-Entropy
//
//  Created by Cirno MainasuK on 2018-5-3.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import UIKit

class NewMemberTableViewController: UITableViewController {

    private var viewModel = NewMemberViewModel()

    @IBAction func doneBarButtonItemPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nibNewMember = UINib(nibName: "NewMemberTableViewCell", bundle: nil)
        tableView.register(nibNewMember, forCellReuseIdentifier: "NewMemberTableViewCell")

        let nibMeasurable = UINib(nibName: "PresetTeamMeasurableTableViewCell", bundle: nil)
        tableView.register(nibMeasurable, forCellReuseIdentifier: "PresetTeamMeasurableTableViewCell")

        viewModel.delegate = self
    }
}

// MARK: - UITableViewDataSource
extension NewMemberTableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0...2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewMemberTableViewCell", for: indexPath) as! NewMemberTableViewCell
            viewModel.configure(cell, at: indexPath)
            return cell

        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PresetTeamMeasurableTableViewCell", for: indexPath) as! PresetTeamMeasurableTableViewCell
            viewModel.configure(cell, at: indexPath)
            return cell
        default:
            assertionFailure()
            return UITableViewCell()
        }
    }

}

// MARK: - NewMemberViewModelDelegate
extension NewMemberTableViewController: NewMemberViewModelDelegate {
    func didUpdated(at indexSet: IndexSet) {
        self.tableView.reloadSections(indexSet, with: .automatic)
    }
}

//
//  BookmarkTableViewController.swift
//  Anti-Entropy
//
//  Created by Cirno MainasuK on 2018-5-1.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import UIKit
import RxSwift
import RxSwiftExt

class BookmarkTableViewController: UITableViewController {

    private let disposeBag = DisposeBag()

    private let presetTeams = Variable<[PresetTeam]>([])

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.cancel, target: self, action: #selector(cancelBarButtonItemPressed(_:)))

        PresetTeamModel.shared.presetTeams
            .bind(to: presetTeams)
            .disposed(by: disposeBag)
    }

}

extension BookmarkTableViewController {
    @objc func cancelBarButtonItemPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - UITableViewDataSource
extension BookmarkTableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presetTeams.value.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookmarkTableViewCell", for: indexPath) as! BookmarkTableViewCell

        let presetTeam = presetTeams.value[indexPath.row]

        // Configure the cell...
        cell.textLabel?.text = "\(presetTeam.member.count)"
        
        return cell
    }

}

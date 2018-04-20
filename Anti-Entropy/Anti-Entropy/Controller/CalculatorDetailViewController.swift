//
//  CalculatorDetailViewController.swift
//  Anti-Entropy
//
//  Created by Cirno MainasuK on 2018-4-20.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Schicksal

class CalculatorDetailViewController: UIViewController {

    var viewModel: CalculatorDetailViewModel!

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.contentInset.top             = 160.0
            tableView.scrollIndicatorInsets.top    = 160.0
            tableView.backgroundColor              = .black
            tableView.indicatorStyle               = .white
            tableView.insetsContentViewsToSafeArea = true
            tableView.tableHeaderView              = UIView()
            tableView.tableFooterView              = UIView()

            let nib = UINib(nibName: "CalculatorTableViewCell", bundle: nil)
            tableView.register(nib, forCellReuseIdentifier: "CalculatorTableViewCell")

            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

// MARK: - UITableViewDelegate
extension CalculatorDetailViewController: UITableViewDelegate {

}

// MARK: - UITableViewDataSource
extension CalculatorDetailViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CalculatorTableViewCell", for: indexPath) as! CalculatorTableViewCell
        return cell
    }

}

//
//  CalculatorViewController.swift
//  Anti-Entropy
//
//  Created by Cirno MainasuK on 2018-4-17.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import UIKit
import RxSwift
import Schicksal

class CalculatorViewController: UIViewController {

    private let disposeBag = DisposeBag()

    var viewModel = CalculatorViewModel()

    // All buff damage - 1 sections (0)
    var damage = [Measurable]()

    // TODO: ViewModel
    // All skill - 6 sections (1 - 6)


    lazy var basicStatusView = BasicStatusView()
    lazy var basicStatusView2 = BasicStatusView()

    @IBOutlet weak var topPagingScrollView: UIScrollView!
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

}

// MARK: - View Life Cycle
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
        setupViewModel()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        tableView.indexPathForSelectedRow.flatMap {
            tableView.deselectRow(at: $0, animated: true)
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        view.endEditing(true)
    }

}

// MARK: - UITableViewDelegate
extension CalculatorViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CalculatorDetailViewController") as! CalculatorDetailViewController
        detailViewController.viewModel = viewModel.createCalculatorDetailViewModel()
        navigationController?.pushViewController(detailViewController, animated: true)
    }

}

// MARK: - UITableViewDataSource
extension CalculatorViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CalculatorTableViewCell", for: indexPath) as! CalculatorTableViewCell

        viewModel.configure(cell, at: indexPath)

        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.titleForHeader(in: section)
    }

}

extension CalculatorViewController {

    private func setupTopPagingScrollView() {
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

    private func setupViewModel() {
        viewModel.basicStatusViewModel.bind(to: basicStatusView)
        viewModel.basicStatusViewModel.basicStatus.asObservable()
            .subscribe(onNext: { [weak self] _ in
                guard let `self` = self else { return }
                self.tableView.reloadData()
            })
            .disposed(by: disposeBag)

    }
}

//
//  CalculatorViewController.swift
//  Anti-Entropy
//
//  Created by Cirno MainasuK on 2018-4-17.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import UIKit
import RxSwift
import RealmSwift
import RxRealm
import Schicksal

class CalculatorViewController: UIViewController {

    private let topPagingScrollViewHeight: CGFloat = 180
    private let scrollViewContentHeight: CGFloat = 152
    private let disposeBag = DisposeBag()

    var viewModel = CalculatorViewModel()

    @IBOutlet weak var scrollViewPageControl: UIPageControl!

    lazy var basicStatusView = BasicStatusView()
    lazy var equipmentView_1 = EquipmentView()
    lazy var equipmentView_2 = EquipmentView()
    lazy var equipmentView_3 = EquipmentView()

    @IBOutlet weak var topPagingScrollView: UIScrollView! {
        didSet {
            topPagingScrollView.delegate = self
        }
    }
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.contentInset.top             = topPagingScrollViewHeight
            tableView.scrollIndicatorInsets.top    = topPagingScrollViewHeight
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

        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(bookmarksBarButtonItemPressed(_:)))

        setupTopPagingScrollView()
        setupViewModel()

        viewModel.presetTeam.value = PresetTeamModel.shared.currentTeam
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

extension CalculatorViewController {
    @objc func bookmarksBarButtonItemPressed(_ sender: UIBarButtonItem) {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "BookmarkNavigationController")
        self.navigationController?.present(controller, animated: true, completion: nil)
    }
}

// MARK: - UITableViewDelegate
extension CalculatorViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        viewModel.didSelect(tableView, at: indexPath)
//        let detailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CalculatorDetailViewController") as! CalculatorDetailViewController
//        detailViewController.viewModel = viewModel.createCalculatorDetailViewModel()
//        navigationController?.pushViewController(detailViewController, animated: true)
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
        topPagingScrollView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: topPagingScrollViewHeight)
        topPagingScrollView.contentSize.width = view.bounds.width * 5
        topPagingScrollView.contentSize.height = topPagingScrollViewHeight
        topPagingScrollView.isPagingEnabled = true

        topPagingScrollView.setContentOffset(CGPoint(x: topPagingScrollView.bounds.width, y: 0), animated: false)

        // margin left & right
        let effectViewFrame = CGRect(x: -view.bounds.width,
                                     y: 0,
                                     width: topPagingScrollView.contentSize.width + topPagingScrollView.bounds.width * 2,
                                     height: topPagingScrollView.bounds.height)

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

        let contentFrame = CGRect(x: 0, y: 0, width: view.bounds.width, height: scrollViewContentHeight)
        basicStatusView.frame = contentFrame
        equipmentView_1.frame = contentFrame
        equipmentView_2.frame = contentFrame
        equipmentView_3.frame = contentFrame
        basicStatusView.frame.origin.x = topPagingScrollView.bounds.width * 2
        equipmentView_1.frame.origin.x = topPagingScrollView.bounds.width * 3
        equipmentView_2.frame.origin.x = topPagingScrollView.bounds.width * 4
        equipmentView_3.frame.origin.x = topPagingScrollView.bounds.width * 5

        vibrancyEffectView.contentView.addSubview(basicStatusView)
        vibrancyEffectView.contentView.addSubview(equipmentView_1)
        vibrancyEffectView.contentView.addSubview(equipmentView_2)
        vibrancyEffectView.contentView.addSubview(equipmentView_3)

        scrollViewPageControl.numberOfPages = 5
        scrollViewPageControl.currentPage = 1
    }

    private func setupViewModel() {
        viewModel.basicStatusViewModel.bind(to: basicStatusView)
        viewModel.equipmentViewModel_1.bind(to: equipmentView_1)
        viewModel.basicStatusViewModel.basicStatus.asObservable()
            .subscribe(onNext: { [weak self] _ in
                self?.tableView.reloadData()
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - UIScrollViewDelegate
extension CalculatorViewController: UIScrollViewDelegate {

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.width
        let page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1
        scrollViewPageControl.currentPage = Int(page)
    }

}

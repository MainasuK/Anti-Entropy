//
//  CalculatorViewModel.swift
//  Anti-Entropy
//
//  Created by Cirno MainasuK on 2018-4-20.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Schicksal
import RealmSwift
import RxRealm
import RxSwiftExt

struct CalculatorViewModel {

    private let disposeBag = DisposeBag()

    weak var tableView: UITableView?

    // input
    let presetTeam = Variable<PresetTeam?>(nil)
    var basicStatusViewModel: BasicStatusViewModel
    var equipmentViewModel_1: EquipmentViewModel
    var equipmentViewModel_2: EquipmentViewModel
    var equipmentViewModel_3: EquipmentViewModel

    private let selectValkyrjaIntelligence = Variable<ValkyrjaIntelligence?>(nil)
    private let selectValkyrja = Variable<Valkyrja?>(nil)

    private let valkyrjaIntelligence_1 = Variable<ValkyrjaIntelligence?>(nil)
    private let valkyrjaIntelligence_2 = Variable<ValkyrjaIntelligence?>(nil)
    private let valkyrjaIntelligence_3 = Variable<ValkyrjaIntelligence?>(nil)

    init() {
        equipmentViewModel_1 = EquipmentViewModel(intelligence: valkyrjaIntelligence_1)
        equipmentViewModel_2 = EquipmentViewModel(intelligence: valkyrjaIntelligence_2)
        equipmentViewModel_3 = EquipmentViewModel(intelligence: valkyrjaIntelligence_3)

        basicStatusViewModel = BasicStatusViewModel()
        basicStatusViewModel.delegate = self

        presetTeam.asObservable()
            .map { $0.flatMap { PresetTeamModel.clone(from: $0) } ?? [] }
            .bind(to: basicStatusViewModel.team)
            .disposed(by: disposeBag)

        presetTeam.asObservable()
            .map { $0?.member.first }
            .bind(to: selectValkyrjaIntelligence)
            .disposed(by: disposeBag)

        presetTeam.asObservable()
            .map { $0.flatMap { $0.member.count > 1 ? $0.member[0] : nil } }
            .bind(to: valkyrjaIntelligence_1)
            .disposed(by: disposeBag)

        presetTeam.asObservable()
            .map { $0.flatMap { $0.member.count > 2 ? $0.member[1] : nil } }
            .bind(to: valkyrjaIntelligence_2)
            .disposed(by: disposeBag)

        presetTeam.asObservable()
            .map { $0.flatMap { $0.member.count > 3 ? $0.member[2] : nil } }
            .bind(to: valkyrjaIntelligence_3)
            .disposed(by: disposeBag)

        selectValkyrjaIntelligence.asObservable()
            .map { $0.flatMap { ValkyrjaModel.clone(from: $0) } }
            .bind(to: selectValkyrja)
            .disposed(by: disposeBag)

        selectValkyrjaIntelligence.asObservable()
            .distinct()
            .bind(to: basicStatusViewModel.intelligence)
            .disposed(by: disposeBag)
    }

}

extension CalculatorViewModel: BasicStatusViewModelDelegate {

    func didSelectValkyrja(at index: Int) {
        guard let presetTeam = presetTeam.value,
        index < presetTeam.member.count else { return }

        selectValkyrjaIntelligence.value = presetTeam.member[index]
        tableView?.reloadData()
    }

    func didUpdateBasicStatus(to basicStatus: BasicStatus) {
        guard let intelligence = selectValkyrjaIntelligence.value,
        intelligence.basicStatus != basicStatus else { return }

        let realm = try! Realm()
        try! realm.write {
            intelligence.HP  = basicStatus.HP
            intelligence.SP  = basicStatus.SP
            intelligence.ATK = basicStatus.ATK
            intelligence.DEF = basicStatus.DEF
            intelligence.CRT = basicStatus.CRT
            intelligence.LV  = basicStatus.LV
        }
    }

}

extension CalculatorViewModel {

    func numberOfSections() -> Int {
        return selectValkyrja.value?.skills.count ?? 0
    }

    func numberOfRows(in section: Int) -> Int {
        return selectValkyrja.value?.skills[section].count ?? 0
    }

}

extension CalculatorViewModel {

    func titleForHeader(in section: Int) -> String? {
        return selectValkyrja.value?.skills[section].localized.caption
    }

    func configure(_ cell: CalculatorTableViewCell, at indexPath: IndexPath) {
        guard let skill = selectValkyrja.value?.skills[indexPath.section],
        let basicStatus = basicStatusViewModel.basicStatus.value else { return }

        let measurables = selectValkyrja.value?.measurables ?? V_WhiteComet().measurables
        let filterdMeasurables = measurables.filter { $0.scope == .oneself }
        cell.measurables = filterdMeasurables       // TODO:
        cell.configure(with: skill, of: basicStatus, at: indexPath)
    }

}

extension CalculatorViewModel {

//    func createCalculatorDetailViewModel() -> CalculatorDetailViewModel {
//        return CalculatorDetailViewModel()
//    }
//
//    func didSelect(_ tableView: UITableView, at indexPath: IndexPath) {
//        
//    }

}

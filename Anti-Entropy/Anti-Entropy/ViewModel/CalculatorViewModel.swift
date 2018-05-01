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

fileprivate let measurables = V_WhiteComet().measurables

struct TestWeapon: Weapon {

    let type: WeaponType = .cannon

    let ATK: ATK = 40
    let CRT: CRT = 4
}

struct CalculatorViewModel {

    private let disposeBag = DisposeBag()
    private let realm = try! Realm()

    let presetTeam = Variable<PresetTeam?>(nil)

    let selectValkyrja = Variable<ValkyrjaIntelligence?>(nil)
    let basicStatusViewModel = BasicStatusViewModel()


    private let team = Variable<[Valkyrja]>([])

//    var supporter = Variable<Valkyrja?>(nil)
//    var skills = [SKS_WhiteComet_SpecialAttack,
//                  SKS_WhiteComet_Ultimate,
//                  SKS_WhiteComet_BasicAttack,
//                  SKS_WhiteComet_Evasion,
//                  SKS_WhiteComet_PassiveSkill,
//                  SKS_WhiteComet_LeaderSkill]

    init() {
        presetTeam.asObservable()
            .map { $0.flatMap { PresetTeamModel.clone(from: $0) } ?? [] }
            .bind(to: team)
            .disposed(by: disposeBag)

        presetTeam.asObservable()
            .map { $0?.member.first }
            .bind(to: selectValkyrja)
            .disposed(by: disposeBag)

        selectValkyrja.asObservable()
            .bind(to: basicStatusViewModel.intelligence)
            .disposed(by: disposeBag)

        Observable.combineLatest(basicStatusViewModel.basicStatus.asObservable(), selectValkyrja.asObservable())
            .subscribe(onNext: { (basicStatus, intelligence) in
                guard let newBasicStatus = basicStatus, let intelligence = intelligence,
                newBasicStatus != intelligence.basicStatus else { return }

                let realm = try! Realm()
                try! realm.write {
                    intelligence.HP  = newBasicStatus.HP
                    intelligence.SP  = newBasicStatus.SP
                    intelligence.ATK = newBasicStatus.ATK
                    intelligence.DEF = newBasicStatus.DEF
                    intelligence.CRT = newBasicStatus.CRT
                    intelligence.LV  = newBasicStatus.LV
                }

            })
            .disposed(by: disposeBag)


//        team.asObservable()
//            .map { $0.member.toArray() }
//            .map { $0.map { ValkyrjaModel.clone(from: $0) } }
//            .bind(to: team)
//            .disposed(by: disposeBag)
//
//
//
//        // Set default value if not exists
//        if let battleIntelligence = realm.object(ofType: PresetTeam.self, forPrimaryKey: 0) {
//            Observable.from(object: battleIntelligence)
//                .bind(to: presetTeam)
//                .disposed(by: disposeBag)
//        } else {
//            let defaultIntelligence = PresetTeam()
//            Observable<PresetTeam>.just(defaultIntelligence)
//                .observeOn(MainScheduler.instance)
//                .subscribe(realm.rx.add(update: false))
//                .disposed(by: disposeBag)
//        }
//
//        basicStatusViewModel = BasicStatusViewModel(with: presetTeam.value.leader!)

        presetTeam.value = PresetTeamModel.shared.currentTeam
    }

}

extension CalculatorViewModel {

    private func update(basicStatus to: BasicStatus) {

    }

}

extension CalculatorViewModel {

    func numberOfSections() -> Int {
        return 0
    }

    func numberOfRows(in section: Int) -> Int {
        return 0
    }

}

extension CalculatorViewModel {

    func titleForHeader(in section: Int) -> String? {
        return nil
//        return leader.value?.skills[section].localized.caption
    }

    func configure(_ cell: CalculatorTableViewCell, at indexPath: IndexPath) {
//        guard let skill = leader.value?.skills[indexPath.section] else { return }
//        let measurables = leader.value?.measurables ?? V_WhiteComet().measurables
//        let filterdMeasurables = measurables.filter { $0.scope == .oneself }
//        cell.measurables = filterdMeasurables       // TODO:
//        cell.configure(with: skill, of: basicStatusViewModel.basicStatus.value, at: indexPath)
    }

}

extension CalculatorViewModel {

    func createCalculatorDetailViewModel() -> CalculatorDetailViewModel {
        return CalculatorDetailViewModel()
    }

    func didSelect(_ tableView: UITableView, at indexPath: IndexPath) {
        
    }

}

//
//  BasicStatusViewModel.swift
//  Anti-Entropy
//
//  Created by Cirno MainasuK on 2018-4-19.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Schicksal
import RealmSwift
import RxRealm

protocol BasicStatusViewModelDelegate {
    func didSelectValkyrja(at index: Int)
    func didUpdateBasicStatus(to basicStatus: BasicStatus)
}

struct BasicStatusViewModel {

    private let disposeBag = DisposeBag()

    // input
    var delegate: BasicStatusViewModelDelegate?
    let intelligence = Variable<ValkyrjaIntelligence?>(nil)
    let team = Variable<[Valkyrja]>([])

    // output
    let basicStatus = Variable<BasicStatus?>(nil)
    let selectTeamMemberIndex = Variable<Int?>(nil)

    private let lv  = Variable<String>("")
    private let hp  = Variable<String>("")
    private let sp  = Variable<String>("")
    private let atk = Variable<String>("")
    private let def = Variable<String>("")
    private let crt = Variable<String>("")

    func bind(to basicStatusView: BasicStatusView) {
        [basicStatusView.hpTextField.rx.textInput  <-> hp,
         basicStatusView.spTextField.rx.textInput  <-> sp,
         basicStatusView.atkTextField.rx.textInput <-> atk,
         basicStatusView.defTextField.rx.textInput <-> def,
         basicStatusView.crtTextField.rx.textInput <-> crt,
         basicStatusView.lvTextField.rx.textInput  <-> lv]
            .forEach { $0.disposed(by: disposeBag) }

        let lvRange = Array(1...80).map { "\($0)" }
        let lvRangeAttribute = lvRange.map {
            NSAttributedString(string: $0, attributes: [.foregroundColor : UIColor.white])
        }
        let lvRangeAttributedObservable = Observable.of(lvRangeAttribute)

        if let pickerView = basicStatusView.lvTextField.inputView as? UIPickerView {
            lvRangeAttributedObservable.bind(to: pickerView.rx.itemAttributedTitles) { (row, element) in
                    return element
                }
                .disposed(by: disposeBag)

            pickerView.rx.itemSelected
                .subscribe(onNext: { (row, component) in
                    basicStatusView.lvTextField.text = lvRange[row]
                })
                .disposed(by: disposeBag)
        }

        let teamFullNameObservable = team.asObservable()
            .map { $0.map { $0.fullName.localized(using: $0.localizeTableName, in: schicksalBundle) } }
        let teamFullNameAttributedObservable = teamFullNameObservable
            .map { $0.map { NSAttributedString(string: $0, attributes: [.foregroundColor : UIColor.white]) } }

        if let pickerView = basicStatusView.valkyrjiaTextField.inputView as? UIPickerView {
            // Set initial value
            teamFullNameObservable
                .map { $0.first ?? "" }
                .take(2)
                .subscribe(onNext: {
                    basicStatusView.valkyrjiaTextField.text = $0
                })
                .disposed(by: disposeBag)

            teamFullNameAttributedObservable.bind(to: pickerView.rx.itemAttributedTitles) { (row, element) in
                return element
            }
            .disposed(by: disposeBag)

            pickerView.rx.itemSelected
                .subscribe(onNext: { (row, element) in
                    let valkyrja = self.team.value[row]
                    basicStatusView.valkyrjiaTextField.text = valkyrja.fullName.localized(using: valkyrja.localizeTableName, in: schicksalBundle)
                    self.selectTeamMemberIndex.value = row
                    self.delegate?.didSelectValkyrja(at: row)
                })
                .disposed(by: disposeBag)
        }

        let observables = [hp, sp, atk, def, crt, lv].map {
            $0.asObservable().map { Int($0) ?? 0 }
        }

        Observable
            .combineLatest(observables) { BasicStatus(HP: $0[0], SP: $0[1], ATK: $0[2], DEF: $0[3], CRT: $0[4], LV: $0[5]) }
            .observeOn(MainScheduler.asyncInstance)
            .subscribe(onNext: {
                self.delegate?.didUpdateBasicStatus(to: $0)
            })
            .disposed(by: disposeBag)
    }   // end bind

    init() {
        intelligence.asObservable()
            .unwrap()
            .map { $0.basicStatus }
            .bind(to: basicStatus)
            .disposed(by: disposeBag)

        basicStatus.asObservable()
            .subscribe()
            .disposed(by: disposeBag)

        basicStatus.asObservable()
            .map { $0?.HP ?? 0 }
            .map { $0 == 0 ? "" : "\($0)" }
            .bind(to: hp)
            .disposed(by: disposeBag)

        basicStatus.asObservable()
            .map { $0?.SP ?? 0 }
            .map { $0 == 0 ? "" : "\($0)" }
            .bind(to: sp)
            .disposed(by: disposeBag)

        basicStatus.asObservable()
            .map { $0?.ATK ?? 0 }
            .map { $0 == 0 ? "" : "\($0)" }
            .bind(to: atk)
            .disposed(by: disposeBag)

        basicStatus.asObservable()
            .map { $0?.DEF ?? 0 }
            .map { $0 == 0 ? "" : "\($0)" }
            .bind(to: def)
            .disposed(by: disposeBag)

        basicStatus.asObservable()
            .map { $0?.CRT ?? 0 }
            .map { $0 == 0 ? "" : "\($0)" }
            .bind(to: crt)
            .disposed(by: disposeBag)

        basicStatus.asObservable()
            .map { $0?.LV ?? 0 }
            .map { $0 == 0 ? "" : "\($0)" }
            .bind(to: lv)
            .disposed(by: disposeBag)
    }

}

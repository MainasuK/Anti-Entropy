//
//  BasicStatusViewModel.swift
//  Anti-Entropy
//
//  Created by Cirno MainasuK on 2018-4-19.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Schicksal
import RealmSwift
import RxRealm


struct BasicStatusViewModel {

    private let disposeBag = DisposeBag()

    // input
    let intelligence = Variable<ValkyrjaIntelligence?>(nil)

    // output
    let basicStatus = Variable<BasicStatus?>(nil)

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
    }

    init() {
        intelligence.asObservable()
            .map { $0?.basicStatus }
            .bind(to: basicStatus)
            .disposed(by: disposeBag)

        basicStatus.asObservable()
            .map { $0?.HP ?? 0 }
            .map { $0 == 0 ? "" : "\($0)" }
            .distinct()
            .bind(to: hp)
            .disposed(by: disposeBag)

        basicStatus.asObservable()
            .map { $0?.SP ?? 0 }
            .map { $0 == 0 ? "" : "\($0)" }
            .distinct()
            .bind(to: sp)
            .disposed(by: disposeBag)

        basicStatus.asObservable()
            .map { $0?.ATK ?? 0 }
            .map { $0 == 0 ? "" : "\($0)" }
            .distinct()
            .bind(to: atk)
            .disposed(by: disposeBag)

        basicStatus.asObservable()
            .map { $0?.DEF ?? 0 }
            .map { $0 == 0 ? "" : "\($0)" }
            .distinct()
            .bind(to: def)
            .disposed(by: disposeBag)

        basicStatus.asObservable()
            .map { $0?.CRT ?? 0 }
            .map { $0 == 0 ? "" : "\($0)" }
            .distinct()
            .bind(to: crt)
            .disposed(by: disposeBag)

        basicStatus.asObservable()
            .map { $0?.LV ?? 0 }
            .map { $0 == 0 ? "" : "\($0)" }
            .distinct()
            .bind(to: lv)
            .disposed(by: disposeBag)

        let observables = [hp, sp, atk, def, crt, lv].map {
            $0.asObservable().map { Int($0) ?? 0 }
        }

        Observable
            .combineLatest(observables) { BasicStatus(HP: $0[0], SP: $0[1], ATK: $0[2], DEF: $0[3], CRT: $0[4], LV: $0[5]) }
            .observeOn(MainScheduler.asyncInstance)
            .bind(to: basicStatus)
            .disposed(by: disposeBag)
    }

}

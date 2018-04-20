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
import Default
import Schicksal

private let df_basicStatusKey = "df_basicStatusKey"

struct BasicStatusViewModel {

    private let disposeBag = DisposeBag()

    let basicStatus: Variable<BasicStatus>

    private let lv:  Variable<String>
    private let hp:  Variable<String>
    private let sp:  Variable<String>
    private let atk: Variable<String>
    private let def: Variable<String>
    private let crt: Variable<String>

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
        let defaultBasicStatus = UserDefaults.standard.df.fetch(forKey: df_basicStatusKey, type: BasicStatus.self) ?? BasicStatus()
        basicStatus = Variable(defaultBasicStatus)

        lv  = Variable("\(defaultBasicStatus.LV)")
        hp  = Variable("\(defaultBasicStatus.HP)")
        sp  = Variable("\(defaultBasicStatus.SP)")
        atk = Variable("\(defaultBasicStatus.ATK)")
        def = Variable("\(defaultBasicStatus.DEF)")
        crt = Variable("\(defaultBasicStatus.CRT)")

        let observables = [hp, sp, atk, def, crt, lv].map {
            $0.asObservable().map { Int($0) ?? 0 }
        }
        
        Observable
            .combineLatest(observables) { BasicStatus(HP: $0[0], SP: $0[1], ATK: $0[2], DEF: $0[3], CRT: $0[4], LV: $0[5]) }
            .do(onNext: { UserDefaults.standard.df.store($0, forKey: df_basicStatusKey) })
            .bind(to: basicStatus)
            .disposed(by: disposeBag)
    }

}

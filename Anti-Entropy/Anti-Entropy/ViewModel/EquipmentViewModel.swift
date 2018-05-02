//
//  EquipmentViewModel.swift
//  Anti-Entropy
//
//  Created by Cirno MainasuK on 2018-5-2.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation
import RxSwift
import RxSwiftExt
import RxCocoa
import Schicksal

protocol EquipmentViewModelDelegate {
}

struct EquipmentViewModel {

    private let disposeBag = DisposeBag()

    let intelligence: Variable<ValkyrjaIntelligence?>

    func bind(to equipmentView: EquipmentView) {
        let fullNameObservable = intelligence.asObservable()
            .map { $0.flatMap { ValkyrjaModel.clone(from: $0) } }
            .map { $0.flatMap { $0.fullName.localized(using: $0.localizeTableName, in: schicksalBundle) } }

        if let pickerView = equipmentView.valkyrjiaTextField.inputView as? UIPickerView {
            fullNameObservable
                .map { $0 ?? "--" }
                .take(2)
                .subscribe(onNext: {
                    equipmentView.valkyrjiaTextField.text = $0
                })
                .disposed(by: disposeBag)
        }
    }

    init(intelligence: Variable<ValkyrjaIntelligence?>) {
        self.intelligence = intelligence
    }

}

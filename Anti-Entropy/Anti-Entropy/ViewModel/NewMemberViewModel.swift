//
//  NewMemberViewModel.swift
//  Anti-Entropy
//
//  Created by Cirno MainasuK on 2018-5-3.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import RxSwiftExt
import Schicksal

protocol NewMemberViewModelDelegate: class {
    func didUpdated(at indexSet: IndexSet)
}

struct NewMemberViewModel {

    private let disposeBag = DisposeBag()
    private let defaultIntelligences = ValkyrjaIntelligence.defaults

    private let intelligence = Variable<ValkyrjaIntelligence?>(ValkyrjaIntelligence.defaults.first)
    private let valkyrjia = Variable<Valkyrja?>(nil)
    private let weapon = Variable<Weapon?>(nil)
    private let avaiableWeaponType = Variable<[Weapon.Type]>([])
    private let valkyrjiaMeasurableSkills = Variable<[Measurable]>([])


    var delegate: NewMemberViewModelDelegate?

    init() {
        intelligence.asObservable()
            .map { $0.flatMap { ValkyrjaModel.clone(from: $0) } }
            .bind(to: valkyrjia)
            .disposed(by: disposeBag)

        valkyrjia.asObservable()
            .map { $0.flatMap { $0.measurables.filter { $0.code != .none && $0 is SkillBase } } ?? [] }
            .bind(to: valkyrjiaMeasurableSkills)
            .disposed(by: disposeBag)

        valkyrjia.asObservable()
            .map { $0.flatMap { $0.weapon } }
            .bind(to: weapon)
            .disposed(by: disposeBag)

        valkyrjia.asObservable()
            .map { $0.flatMap { valkyrjia in WeaponModel.allWeaponType.filter { weaponType in valkyrjia.weaponType.contains(weaponType.type) } } ?? [] }
            .bind(to: avaiableWeaponType)
            .disposed(by: disposeBag)
    }

}

extension NewMemberViewModel {

    func didSelectValkyrja(at row: Int) {
        intelligence.value = defaultIntelligences[row]
        delegate?.didUpdated(at: IndexSet([3]))
    }

    func didSelectWeaponType(_ weaponType: Weapon.Type, of rarity: Rarity) {

    }

}

extension NewMemberViewModel {

    func numberOfSections() -> Int {
        // section 0: New Member
        // section 1: Weapon
        // section 2: Stigmata
        // section 3: Skills
        return 4
    }

    func numberOfRows(in section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            guard let _ = self.valkyrjia.value else { return 0 }
            return 1
        case 2:
            guard let _ = self.valkyrjia.value else { return 0 }
            return 3
        case 3:
            guard let _ = self.valkyrjia.value else { return 0 }
            return valkyrjiaMeasurableSkills.value.count
        default:
            return 0
        }
    }

    //    func titleForHeader(in section: Int) -> String? {
    //        return selectValkyrja.value?.skills[section].localized.caption
    //    }

    func configure(_ cell: NewMemberTableViewCell, at indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            configureValkyrjia(cell)
        case 1:
            configureWeapon(cell)
        default:
            break
        }
    }

    private func configureValkyrjia(_ cell: NewMemberTableViewCell) {
        guard let pickerView = cell.textField.inputView as? UIPickerView else { return }
        let valkyrjas = Observable.of(defaultIntelligences)
            .map { $0.map { ValkyrjaModel.clone(from: $0) } }
        let valkyrjaFullNames = valkyrjas
            .map { $0.map { $0.fullName.localized(using: $0.localizeTableName, in: schicksalBundle) } }
        let fullNameAttributedObservable = valkyrjaFullNames
            .map { $0.map { NSAttributedString(string: $0, attributes: [.foregroundColor : UIColor.white]) } }

        fullNameAttributedObservable.bind(to: pickerView.rx.itemAttributedTitles) { (row, element) in
            return element
            }
            .disposed(by: disposeBag)

        valkyrjia.asObservable()
            .map { $0.flatMap { $0.fullName.localized(using: $0.localizeTableName, in: schicksalBundle) } }
            .bind(to: cell.textField.rx.text)
            .disposed(by: disposeBag)

        pickerView.rx.itemSelected
            .subscribe(onNext: { (row, element) in
                let intelligence = self.defaultIntelligences[row]
                self.intelligence.value = intelligence
                self.didSelectValkyrja(at: row)
            })
            .disposed(by: disposeBag)
    }   // end configureValkyrjia(…)

    private func configureWeapon(_ cell: NewMemberTableViewCell) {
        guard let pickerView = cell.textField.inputView as? UIPickerView else { return }
//        guard let canUsedWeaponTypes = valkyrjia.value?.weaponType else { return }
//        guard let valkyrjia = valkyrjia.value else { return }
//
//        let canUsedWeaponTypesObservable = valkyrjia.asObservable()
//            .map { $0?.weaponType }
//
//        let avaiableWeaponObservable = canUsedWeaponTypesObservable
//            .map { $0.flatMap { avaiableWeapon in WeaponModel.allWeaponType.filter { avaiableWeapon.contains($0.type) } } }
//
////        let attributedObservable = avaiableWeaponObservable
////            .map { $0.map { $0.flatMap { NSAttributedString(string: $0, attributes: [.foregroundColor : UIColor.white]) } } }
////
////        let canUsedWeaponTypes = WeaponModel.allWeaponType.filter { canUsedWeaponTypes.contains($0.type) }
////        let avaiableWeaponObservable = Observable.just(avaiableWeapon)
////        let attributedObservable = captionObservable
//////            .map { $0.map { NSAttributedString(string: $0, attributes: [.foregroundColor : UIColor.white]) } }

        avaiableWeaponType.asObservable()
            .bind(to: pickerView.rx.items(adapter: WeaponPickerViewViewAdapter()))
            .disposed(by: disposeBag)

        pickerView.rx.modelSelected(Int.self)
            .map { (indexes) in
                let type = self.avaiableWeaponType.value[indexes[0]]
                let code = type.code
                let rarity = type.rarity[indexes[1]]
                self.intelligence.value?.weaponCode = code
                self.intelligence.value?.weaponRarity = rarity
                return WeaponModel.clone(from: code, of: rarity)
            }
            .bind(to: weapon)
            .disposed(by: disposeBag)

        weapon.asObservable()
            .map { $0.flatMap { type(of: $0).attributedString.string + " Lv.\($0.currentRarity.rawValue)" } }
            .bind(to: cell.textField.rx.text)
            .disposed(by: disposeBag)
    }   // end configureWeapon(…)

    func configure(_ cell: PresetTeamMeasurableTableViewCell, at indexPath: IndexPath) {

    }

}

final class WeaponPickerViewViewAdapter
    : NSObject
    , UIPickerViewDataSource
    , UIPickerViewDelegate
    , RxPickerViewDataSourceType
    , SectionedViewDataSourceType {
    typealias Element = [Weapon.Type]
    private var items: Element = []

    func model(at indexPath: IndexPath) throws -> Any {
        return indexPath.row
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return items.count == 0 ? 0 : 2
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:     return items.count
        case 1:     return items[pickerView.selectedRow(inComponent: 0)].rarity.count
        default:    return 0
        }
    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        label.textAlignment = .center

        switch component {
        case 0:
            label.attributedText = items[row].attributedString
        case 1:
            let level = items[pickerView.selectedRow(inComponent: 0)].rarity[row].rawValue
            label.attributedText = NSAttributedString(string: "Lv.\(level)", attributes: [.foregroundColor : UIColor.white])
        default:
            assertionFailure()
            break
        }

        return label
    }

    func pickerView(_ pickerView: UIPickerView, observedEvent: Event<[Weapon.Type]>) {
        Binder(self) { (adapter, items) in
            adapter.items = items
            pickerView.reloadAllComponents()
        }.on(observedEvent)
    }

}

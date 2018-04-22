//
//  CalculatorViewModel.swift
//  Anti-Entropy
//
//  Created by Cirno MainasuK on 2018-4-20.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation
import RxSwift
import Schicksal

struct TestWeapon: Weapon {
    let ATK = 40
    let CRT = 4
}

struct CalculatorViewModel {

    private let disposeBag = DisposeBag()

    var basicStatusViewModel = BasicStatusViewModel()

    var leader: Variable<Valkyrja>
    var member: Variable<(Valkyrja?, Valkyrja?)>
    var supporter: Variable<Valkyrja?>

    var skills: Skills = []
//    var skills = [SKS_WhiteComet_SpecialAttack,
//                  SKS_WhiteComet_Ultimate,
//                  SKS_WhiteComet_BasicAttack,
//                  SKS_WhiteComet_Evasion,
//                  SKS_WhiteComet_PassiveSkill,
//                  SKS_WhiteComet_LeaderSkill]

    init() {
        let whiteComet = V_WhiteComet(level: 80, rank: .SSS)

        leader = Variable<Valkyrja>(whiteComet)
        member = Variable<(Valkyrja?, Valkyrja?)>((nil, nil))
        supporter = Variable<Valkyrja?>(nil)


    }

}

extension CalculatorViewModel {

    func numberOfSections() -> Int {
        return leader.value.skills.count
    }

    func numberOfRows(in section: Int) -> Int {
        return leader.value.skills[section].count
    }

}

extension CalculatorViewModel {

    func titleForHeader(in section: Int) -> String? {
        return leader.value.skills[section].text
    }

    func configure(_ cell: CalculatorTableViewCell, at indexPath: IndexPath) {
        let skill = leader.value.skills[indexPath.section]
        cell.configure(with: skill, of: basicStatusViewModel.basicStatus.value, at: indexPath)
    }

}

extension CalculatorViewModel {

    func createCalculatorDetailViewModel() -> CalculatorDetailViewModel {
        return CalculatorDetailViewModel()
    }

}

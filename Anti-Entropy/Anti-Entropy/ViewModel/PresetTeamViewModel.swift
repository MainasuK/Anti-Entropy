//
//  PresetTeamViewModel.swift
//  Anti-Entropy
//
//  Created by Cirno MainasuK on 2018-5-3.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import UIKit
import RxSwift

struct PresetTeamViewModel {

    // input
    let presetTeam = Variable<PresetTeam?>(nil)

}

extension PresetTeamViewModel {

    func numberOfSections() -> Int {
    // section 0: Team Name

    // section 1: Member 1
    // section 2: Member 2
    // section 3: Member 3
    // section 4: Member 4

    // section 5: Add Member Button
    return 1 + 4 + 1
    }

    func numberOfRows(in section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 1 + 3 + 2
        case 5:
            return presetTeam.value?.member.count ?? 0 < 4 ? 1 : 0
        default:
            return 0
        }
    }

//    func titleForHeader(in section: Int) -> String? {
//        return selectValkyrja.value?.skills[section].localized.caption
//    }

    func configure(_ cell: PresetTeamTableViewCell, at indexPath: IndexPath) {
//        guard let skill = selectValkyrja.value?.skills[indexPath.section],
//            let basicStatus = basicStatusViewModel.basicStatus.value else { return }
//
//        let measurables = selectValkyrja.value?.measurables ?? V_WhiteComet().measurables
//        let filterdMeasurables = measurables.filter { $0.scope == .oneself }
//        cell.measurables = filterdMeasurables       // TODO:
//        cell.configure(with: skill, of: basicStatus, at: indexPath)
    }

    func configure(_ cell: PresetTeamMeasurableTableViewCell, at indexPath: IndexPath) {
    }

    func configure(_ cell: PresetTeamAddMemberTableViewCell, at indexPath: IndexPath) {
    }

}

//
//  CalculatorDetailViewModel.swift
//  Anti-Entropy
//
//  Created by Cirno MainasuK on 2018-4-20.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation
import RxSwift
import Schicksal

struct CalculatorDetailViewModel {

    var damageTransform = DetailSection.damageTransform([])

    var sections: [DetailSection] {
        return [damageTransform]
    }

}

extension CalculatorDetailViewModel {

    enum DetailSection {
        case damageTransform([SkillBase])

        var count: Int {
            switch self {
            case .damageTransform(let skillTypeBases):
                return skillTypeBases.count
            default:
                return 0
            }
        }
    }

}

extension CalculatorDetailViewModel {

    func numberOfSections() -> Int {
        return sections.count
    }

    func numberOfRows(in section: Int) -> Int {
        return sections[section].count
    }

}

extension CalculatorDetailViewModel {

    //    func titleForHeader(in section: Int) -> String? {
    //        return skills[section].text
    //    }

    func configure(_ cell: CalculatorTableViewCell, at indexPath: IndexPath) {
        switch sections[indexPath.section] {
        case .damageTransform(let skillbases):
            cell.configure(with: skillbases, at: indexPath.row)
        default: return
        }
    }

}

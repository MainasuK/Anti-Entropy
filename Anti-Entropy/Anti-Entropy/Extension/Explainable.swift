//
//  Explainable.swift
//  Anti-Entropy
//
//  Created by Cirno MainasuK on 2018-4-24.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation
import Localize_Swift
import Schicksal

private let schicksalBundle = Bundle(identifier: Schicksal.frameworkBundleIdentifier)

private struct ExplainableContainer: Explainable {
    var caption: String
    var content: String
    var localizeTableName: String?
    var bundleIdentifier: String
}

extension Explainable {

    var localized: Explainable {
        let localizedCaption = caption.localized(using: localizeTableName, in: schicksalBundle)
        let localizedContent = content.localized(using: localizeTableName, in: schicksalBundle)

        let explainable = ExplainableContainer(caption: localizedCaption,
                                               content: localizedContent,
                                               localizeTableName: localizeTableName,
                                               bundleIdentifier: bundleIdentifier)

        return explainable
    }

}

//
//  Property.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-16.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public typealias HP  = Int
public typealias SP  = Int
public typealias ATK = Int
public typealias DEF = Int
public typealias CRT = Int
public typealias LV  = Int

public protocol Explanation {

    var caption_EN: String { get }
    var content_EN: String { get }

    var caption_CN: String { get }
    var content_CN: String { get }

    var caption_JP: String { get }
    var content_JP: String { get }

}

extension Explanation {

    public var caption: String {
        return caption_JP
    }

    public var content: String {
        return content_JP
    }

}

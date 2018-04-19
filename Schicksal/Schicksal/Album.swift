//
//  Album.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-4-16.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

public struct Album {

    // MARK: - Singleton
    private static let instance = Album()

    private init() {

    }

    public static var shared: Album {
        return self.instance
    }

    public lazy var stigmata: [Stigmata] = [
        // Jixuanyuan Aqua
        S_JixuanyuanAqua_T(currentLv: .twentyFive),
        S_JixuanyuanAqua_C(currentLv: .twentyFive),
        S_JixuanyuanAqua_B(currentLv: .twentyFive),
        S_JixuanyuanAqua_T(currentLv: .thirtyFive),
        S_JixuanyuanAqua_C(currentLv: .thirtyFive),
        S_JixuanyuanAqua_B(currentLv: .thirtyFive),
    ]
    
}

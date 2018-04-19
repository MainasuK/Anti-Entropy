//
//  ValkyrjaTests.swift
//  SchicksalTests
//
//  Created by Cirno MainasuK on 2018-4-16.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import XCTest
@testable import Schicksal

struct TestWeapon: Weapon {
    let ATK = 40
    let CRT = 4
}

class ValkyrjaTests: XCTestCase {

    let whiteComet = V_WhiteComet(lv: 15,
                                basicStatus: BasicStatus(HP: 697, SP: 104, ATK: 107, DEF: 46, CRT: 11),
                                weapon: TestWeapon(),
                                stigmataSuit: StigmataSuit(suit: [.T: S_JixuanyuanAqua_T(currentLv: .twentyFive),
                                                                  .C: S_JixuanyuanAqua_C(currentLv: .twentyFive),
                                                                  .B: S_JixuanyuanAqua_B(currentLv: .twentyFive)]),
                                skills: [])

    // 举例：
    // 白练，装备：USP45、姬轩辕戏水一套：
    // 全伤害总加成幅度为：逆神巫女被动“缭乱刃”50%+李耳红上36% ，合计86%。
    // 物理伤害总加成幅度为： 虚无之刃60%（45%+15%）+普朗克中51%，合计111%。
    // 暴击伤害总倍率为：基础200%+逆神巫女必杀被动“血振”40%+逆神巫女被动“兜穿”30%，合计270%。
    // 物理易伤效果总量：雪地狙击必杀效果“狙击锁定”35%。
    // 全伤害易伤为：牛顿下，31%
    // 生物对异能的属性克制：30%
    // 以上类型相乘则为：（1+0.5+0.36）X（1+0.6+0.51）X（2+0.4+0.3）X（1+0.35）X（1+0.31）X（1+0.3）=24.36 最终加成为24.36
    func testExample() {
        print("物理无暴击无易伤", whiteComet.normalPhysicalDamageUP)
        print("物理无暴击带易伤", whiteComet.normalPhysicalDamgeWithDamgeTakenUP)
        print("物理有暴击无易伤", whiteComet.criticalPhysicalDamageUP)
        print("物理有暴击带易伤", whiteComet.criticalPhysicalDamageWithDamgeTakenUP)
        print("雷元素无易伤", whiteComet.normalLightningDamageUP)
        print("雷元素带易伤", whiteComet.normalLightningDamageWithDamgeTakenUP)
        print("火元素无易伤", whiteComet.normalFireDamageUP)
        print("火元素带易伤", whiteComet.normalFireDamageWithDamgeTakenUP)
        print("冰元素无易伤", whiteComet.normalIceDamageUP)
        print("冰元素带易伤", whiteComet.normalIceDamageWithDamgeTakenUP)

        print("物理有暴击带易伤属性克制", whiteComet.criticalPhysicalDamageWithDamgeTakenUP.propertyUP)
        print("暴击率", whiteComet.critRate)
    }

}

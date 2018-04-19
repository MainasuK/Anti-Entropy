//
//  MeasureableTests.swift
//  SchicksalTests
//
//  Created by Cirno MainasuK on 2018-4-16.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import XCTest
@testable import Schicksal

struct MeasurableStruct: Measurable {
    var damageUP: Percentage               = 0.500 + 0.360
    var physicalDamageUP: Percentage       = 0.450 + 0.150 + 0.510
    var lightningDamageUP: Percentage      = 0.000
    var fireDamageUP: Percentage           = 0.000
    var iceDamageUP: Percentage            = 0.000
    var damageTakenUP: Percentage          = 0.310
    var physicalDamageTakenUP: Percentage  = 0.350
    var lightningDamageTakenUP: Percentage = 0.000
    var fireDamageTakenUP: Percentage      = 0.000
    var iceDamageTakenUP: Percentage       = 0.000
    var criticalDamageUP: Percentage       = 0.400 + 0.300
}

class MeasureableTests: XCTestCase {

    let example = MeasurableStruct()

    // 举例：
    // 逆神巫女，装备：虚无之刃、李耳红上、普朗克中、牛顿下。连击到达50开大并按下虚无的主动技能。刃反打到被SS雪地开大冰冻的异能类型敌人身上出现暴击的具体计算：
    // 全伤害总加成幅度为：逆神巫女被动“缭乱刃”50%+李耳红上36% ，合计86%。
    // 物理伤害总加成幅度为： 虚无之刃60%（45%+15%）+普朗克中51%，合计111%。
    // 暴击伤害总倍率为：基础200%+逆神巫女必杀被动“血振”40%+逆神巫女被动“兜穿”30%，合计270%。
    // 物理易伤效果总量：雪地狙击必杀效果“狙击锁定”35%。
    // 全伤害易伤为：牛顿下，31%
    // 生物对异能的属性克制：30%
    // 以上类型相乘则为：（1+0.5+0.36）X（1+0.6+0.51）X（2+0.4+0.3）X（1+0.35）X（1+0.31）X（1+0.3）=24.36 最终加成为24.36
    func testExample() {
        print("物理无暴击无易伤", example.normalPhysicalDamageUP)
        print("物理无暴击带易伤", example.normalPhysicalDamgeWithDamgeTakenUP)
        print("物理有暴击无易伤", example.criticalPhysicalDamageUP)
        print("物理有暴击带易伤", example.criticalPhysicalDamageWithDamgeTakenUP)
        print("雷元素无易伤", example.normalLightningDamageUP)
        print("雷元素带易伤", example.normalLightningDamageWithDamgeTakenUP)
        print("火元素无易伤", example.normalFireDamageUP)
        print("火元素带易伤", example.normalFireDamageWithDamgeTakenUP)
        print("冰元素无易伤", example.normalIceDamageUP)
        print("冰元素带易伤", example.normalIceDamageWithDamgeTakenUP)

        print("物理有暴击带易伤属性克制", example.criticalPhysicalDamageWithDamgeTakenUP.propertyUP)
    }
    
}

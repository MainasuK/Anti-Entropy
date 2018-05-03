//
//  MeasurableModel.swift
//  Schicksal
//
//  Created by Cirno MainasuK on 2018-5-3.
//  Copyright © 2018年 MainasuK. All rights reserved.
//

import Foundation

@objc public enum MeasurableCode: Int {

    case none

    // Note: return Addition when determine OR scope is .all

    // MARK: - Skill - White Comet
    case SK_WhiteComet_TopHelix
    case SK_WhiteComet_GravityFreak
    case SK_WhiteComet_ValkyrieImpact
    case SK_WhiteComet_MeteorShard
    case SK_WhiteComet_CriticalMastery
    case SK_WhiteComet_MeteorBless_Guider
    case SK_WhiteComet_MeteorBless
    case SK_WhiteComet_Guider

    // MARK: - Skill - Valkyrie Chariot
    case SK_ValkyrieChariot_AirSmash
    case SK_ValkyrieChariot_HighGravity
    case SK_ValkyrieChariot_VoidExplosion_GravitationalCollapse
    case SK_ValkyrieChariot_GravityTreaing
    case SK_ValkyrieChariot_ChainReaction
    case SK_ValkyrieChariot_QuantumLock
    case SK_ValkyrieChariot_AgravityWall
    case SK_ValkyrieChariot_ParticleCharge
    case SK_ValkyrieChariot_RiotArmor_RiotArmor
    case SK_ValkyrieChariot_RiotArmor
    case SK_ValkyrieChariot_RiotArmor2

    // MARK: - Skill - Crimson Impulse
    case SK_CrimsonImpulse_SoulPower
    case SK_CrimsonImpulse_SakuraNoHaku
    case SK_CrimsonImpulse_NightSakura
    case SK_CrimsonImpulse_InstantDash
    case SK_CrimsonImpulse_BladePuncture
    case SK_CrimsonImpulse_SpiritOfLoyalty_SpiritOfLoyalty
    case SK_CrimsonImpulse_SpiritOfLoyalty
    case SK_CrimsonImpulse_SpiritOfLoyalty2
}

public struct MeasurableModel {
    public static func clone(from code: MeasurableCode) -> Measurable? {
        switch code {
        case .none:             return nil

        // MARK: - Skill - White Comet
        case .SK_WhiteComet_TopHelix:           return SK_WhiteComet_TopHelix()
        case .SK_WhiteComet_GravityFreak:       return SK_WhiteComet_GravityFreak()
        case .SK_WhiteComet_ValkyrieImpact:     return SK_WhiteComet_ValkyrieImpact()
        case .SK_WhiteComet_MeteorShard:        return SK_WhiteComet_MeteorShard()
        case .SK_WhiteComet_CriticalMastery:    return SK_WhiteComet_CriticalMastery()
        case .SK_WhiteComet_MeteorBless_Guider: return SK_WhiteComet_MeteorBless_Guider()
        case .SK_WhiteComet_MeteorBless:        return SK_WhiteComet_MeteorBless()
        case .SK_WhiteComet_Guider:             return SK_WhiteComet_Guider()

        // MARK: - Skill - Valkyrie Chariot
        case .SK_ValkyrieChariot_AirSmash:      return SK_ValkyrieChariot_AirSmash()
        case .SK_ValkyrieChariot_HighGravity:   return SK_ValkyrieChariot_HighGravity()
        case .SK_ValkyrieChariot_VoidExplosion_GravitationalCollapse:
            return SK_ValkyrieChariot_VoidExplosion_GravitationalCollapse()
        case .SK_ValkyrieChariot_GravityTreaing:return SK_ValkyrieChariot_GravityTreaing()
        case .SK_ValkyrieChariot_ChainReaction: return SK_ValkyrieChariot_ChainReaction()
        case .SK_ValkyrieChariot_QuantumLock:   return SK_ValkyrieChariot_QuantumLock()
        case .SK_ValkyrieChariot_AgravityWall:  return SK_ValkyrieChariot_AgravityWall()
        case .SK_ValkyrieChariot_ParticleCharge:return SK_ValkyrieChariot_ParticleCharge()
        case .SK_ValkyrieChariot_RiotArmor_RiotArmor:
            return SK_ValkyrieChariot_RiotArmor_RiotArmor()
        case .SK_ValkyrieChariot_RiotArmor:     return SK_ValkyrieChariot_RiotArmor()
        case .SK_ValkyrieChariot_RiotArmor2:    return SK_ValkyrieChariot_RiotArmor2()

        // MARK: - Skill - Crimson Impulse
        case .SK_CrimsonImpulse_SoulPower:      return SK_CrimsonImpulse_SoulPower()
        case .SK_CrimsonImpulse_SakuraNoHaku:   return SK_CrimsonImpulse_SakuraNoHaku()
        case .SK_CrimsonImpulse_NightSakura:    return SK_CrimsonImpulse_NightSakura()
        case .SK_CrimsonImpulse_InstantDash:    return SK_CrimsonImpulse_InstantDash()
        case .SK_CrimsonImpulse_BladePuncture:  return SK_CrimsonImpulse_BladePuncture()
        case .SK_CrimsonImpulse_SpiritOfLoyalty_SpiritOfLoyalty:
            return SK_CrimsonImpulse_SpiritOfLoyalty_SpiritOfLoyalty()
        case .SK_CrimsonImpulse_SpiritOfLoyalty:return SK_CrimsonImpulse_SpiritOfLoyalty()
        case .SK_CrimsonImpulse_SpiritOfLoyalty2:
            return SK_CrimsonImpulse_SpiritOfLoyalty2()
        }
    }
}

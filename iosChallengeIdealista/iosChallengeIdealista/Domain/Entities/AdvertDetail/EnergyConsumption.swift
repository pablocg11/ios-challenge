//
//  EnergyConsumption.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 22/1/25.
//

import Foundation

struct EnergyConsumption: Codable {
    let type: String
    
    init(type: String) {
        self.type = type
    }
    
    init(dto: EnergyConsumptionDTO) {
        self.type = dto.type
    }
}

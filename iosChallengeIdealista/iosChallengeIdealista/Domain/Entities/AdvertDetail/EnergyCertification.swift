//
//  EnergyCertification.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 22/1/25.
//

import Foundation

struct EnergyCertification: Equatable {
    let title: String
    let energyConsumption: EnergyConsumption

    init(title: String, energyConsumption: EnergyConsumption) {
        self.title = title
        self.energyConsumption = energyConsumption
    }

    init(dto: EnergyCertificationDTO) {
        self.title = dto.title.uppercased()
        self.energyConsumption = EnergyConsumption(dto: dto.energyConsumption)
    }
}

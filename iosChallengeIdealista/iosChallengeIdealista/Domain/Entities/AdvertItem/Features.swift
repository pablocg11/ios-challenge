//
//  Feature.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 21/1/25.
//

import Foundation

struct Features: Codable {
    let hasAirConditioning: Bool
    let hasBoxRoom: Bool
    
    init(hasAirConditioning: Bool, hasBoxRoom: Bool) {
        self.hasAirConditioning = hasAirConditioning
        self.hasBoxRoom = hasBoxRoom
    }
    
    init(dto: FeaturesDTO) {
        self.hasAirConditioning = dto.hasAirConditioning
        self.hasBoxRoom = dto.hasBoxRoom
    }
}

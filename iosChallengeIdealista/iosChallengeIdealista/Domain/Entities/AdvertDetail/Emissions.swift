//
//  Emissions.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 22/1/25.
//

import Foundation

struct Emissions: Codable {
    let type: String
    
    init(type: String) {
        self.type = type
    }
    
    init(dto: EmissionsDTO) {
        self.type = dto.type
    }
}

//
//  Ubication.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 22/1/25.
//

import Foundation

struct Ubication {
    let latitude: Double
    let longitude: Double

    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }

    init(dto: UbicationDTO) {
        self.latitude = dto.latitude
        self.longitude = dto.longitude
    }
}

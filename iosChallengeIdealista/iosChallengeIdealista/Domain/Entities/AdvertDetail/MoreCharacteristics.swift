//
//  MoreCharacteristics.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 22/1/25.
//

import Foundation
import SwiftUI

struct MoreCharacteristics: Hashable {
    let communityCosts: Double
    let roomNumber: Int
    let bathNumber: Int
    let exterior: Bool
    let housingFurnitures: String
    let agencyIsABank: Bool
    let energyCertificationType: String
    let flatLocation: String
    let modificationDate: Int
    let constructedArea: Int
    let lift: Bool
    let boxroom: Bool
    let isDuplex: Bool
    let floor: String
    let status: String

    var formattedModificationDate: String {
        let timeInSeconds = TimeInterval(modificationDate) / 1000
        let date = Date(timeIntervalSince1970: timeInSeconds)

        return DateFormatter.shortDateFormatter.string(from: date)
    }

    init(
        communityCosts: Double,
        roomNumber: Int,
        bathNumber: Int,
        exterior: Bool,
        housingFurnitures: String,
        agencyIsABank: Bool,
        energyCertificationType: String,
        flatLocation: String,
        modificationDate: Int,
        constructedArea: Int,
        lift: Bool,
        boxroom: Bool,
        isDuplex: Bool,
        floor: String,
        status: String
    ) {
        self.communityCosts = communityCosts
        self.roomNumber = roomNumber
        self.bathNumber = bathNumber
        self.exterior = exterior
        self.housingFurnitures = housingFurnitures
        self.agencyIsABank = agencyIsABank
        self.energyCertificationType = energyCertificationType
        self.flatLocation = flatLocation
        self.modificationDate = modificationDate
        self.constructedArea = constructedArea
        self.lift = lift
        self.boxroom = boxroom
        self.isDuplex = isDuplex
        self.floor = floor
        self.status = status
    }

    init(dto: MoreCharacteristicsDTO) {
        self.communityCosts = dto.communityCosts
        self.roomNumber = dto.roomNumber
        self.bathNumber = dto.bathNumber
        self.exterior = dto.exterior
        self.housingFurnitures = dto.housingFurnitures
        self.agencyIsABank = dto.agencyIsABank
        self.energyCertificationType = dto.energyCertificationType.uppercased()
        self.flatLocation = dto.flatLocation
        self.modificationDate = dto.modificationDate
        self.constructedArea = dto.constructedArea
        self.lift = dto.lift
        self.boxroom = dto.boxroom
        self.isDuplex = dto.isDuplex
        self.floor = dto.floor
        self.status = dto.status
    }
}

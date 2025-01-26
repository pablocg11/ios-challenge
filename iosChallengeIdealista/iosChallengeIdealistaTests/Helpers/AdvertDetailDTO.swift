//
//  AdvertDetailDTO.swift
//  iosChallengeIdealistaTests
//
//  Created by Pablo Castro on 26/1/25.
//

import Foundation
@testable import iosChallengeIdealista

extension AdvertDetailDTO {
    static func getMock() -> AdvertDetailDTO {
        return getMockAdvertDetailDTO()
    }

    private static func getMockAdvertDetailDTO() -> AdvertDetailDTO {
        return AdvertDetailDTO(
            adId: 1,
            price: 250000.0,
            priceInfo: PriceInfoDetailDTO(amount: 250000.0, currencySuffix: "€"),
            operation: "sale",
            propertyType: "Flat",
            extendedPropertyType: "Luxury Flat",
            homeType: "Apartment",
            state: "Available",
            multimedia: MultimediaDTO(images: [
                ImageDTO(url: "https://example.com/images/property1_1.jpg", tag: "Living Room"),
                ImageDTO(url: "https://example.com/images/property1_2.jpg", tag: "Bedroom")
            ]),
            propertyComment: "Spacious and modern apartment in the heart of the city.",
            ubication: UbicationDTO(
                latitude: 40.4168,
                longitude: -3.7038
            ),
            country: "Spain",
            moreCharacteristics: MoreCharacteristicsDTO(
                communityCosts: 100.0,
                roomNumber: 3,
                bathNumber: 2,
                exterior: true,
                housingFurnitures: "Fully furnished",
                agencyIsABank: false,
                energyCertificationType: "A",
                flatLocation: "Central",
                modificationDate: 1727683968000,
                constructedArea: 85,
                lift: true,
                boxroom: true,
                isDuplex: false,
                floor: "1",
                status: "New"
            ),
            energyCertification: EnergyCertificationDTO(
                title: "Energy Certification",
                energyConsumption: EnergyConsumptionDTO(type: "A+")
            )
        )
    }
}

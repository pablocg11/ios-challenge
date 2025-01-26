//
//  AdvertDetail.swift
//  iosChallengeIdealistaTests
//
//  Created by Pablo Castro on 26/1/25.
//

import Foundation
@testable import iosChallengeIdealista

extension AdvertDetail {
    static func getMock() -> AdvertDetail {
        return getMockAdvertDetail()
    }

    private static func getMockAdvertDetail() -> AdvertDetail {
        return AdvertDetail(
            adId: 1,
            price: 250000.0,
            priceInfo: PriceInfoDetail(amount: 250000.0, currencySuffix: "€"),
            operation: "sale",
            propertyType: "Flat",
            extendedPropertyType: "Luxury Flat",
            homeType: "Apartment",
            state: "Available",
            multimedia: Multimedia(images: [
                ImageEntity(url: "https://example.com/images/property1_1.jpg", tag: "Living Room"),
                ImageEntity(url: "https://example.com/images/property1_2.jpg", tag: "Bedroom")
            ]),
            propertyComment: "Spacious and modern apartment in the heart of the city.",
            ubication: Ubication(
                latitude: 40.4168,
                longitude: -3.7038
            ),
            country: "Spain",
            moreCharacteristics: MoreCharacteristics(
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
            energyCertification: EnergyCertification(
                title: "Energy Certification",
                energyConsumption: EnergyConsumption(type: "A+")
            )
        )
    }
}

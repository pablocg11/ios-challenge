//
//  AdvertDetail.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 22/1/25.
//

import Foundation
import SwiftUI

struct AdvertDetail {
    let adId: Int
    let price: Double
    let priceInfo: PriceInfoDetail
    let operation: String
    let propertyType: String
    let extendedPropertyType: String
    let homeType: String
    let state: String
    let multimedia: Multimedia
    let propertyComment: String
    let ubication: Ubication
    let country: String
    let moreCharacteristics: MoreCharacteristics
    let energyCertification: EnergyCertification

    var operationFormatted: LocalizedStringKey {
        switch operation {
        case "sale":
            return "sale"
        case "rent":
            return "rent"
        default:
            return "unknown"
        }
    }

    var propertyTypeFormatted: LocalizedStringKey {
        switch extendedPropertyType {
        case "flat":
            return "flat"
        default:
            return "unknown"
        }
    }

    init(
        adId: Int,
        price: Double,
        priceInfo: PriceInfoDetail,
        operation: String,
        propertyType: String,
        extendedPropertyType: String,
        homeType: String,
        state: String,
        multimedia: Multimedia,
        propertyComment: String,
        ubication: Ubication,
        country: String,
        moreCharacteristics: MoreCharacteristics,
        energyCertification: EnergyCertification
    ) {
        self.adId = adId
        self.price = price
        self.priceInfo = priceInfo
        self.operation = operation
        self.propertyType = propertyType
        self.extendedPropertyType = extendedPropertyType
        self.homeType = homeType
        self.state = state
        self.multimedia = multimedia
        self.propertyComment = propertyComment
        self.ubication = ubication
        self.country = country
        self.moreCharacteristics = moreCharacteristics
        self.energyCertification = energyCertification
    }

    init(dto: AdvertDetailDTO) {
        self.adId = dto.adId
        self.price = dto.price
        self.priceInfo = PriceInfoDetail(dto: dto.priceInfo)
        self.operation = dto.operation
        self.propertyType = dto.propertyType
        self.extendedPropertyType = dto.extendedPropertyType
        self.homeType = dto.homeType
        self.state = dto.state
        self.multimedia = Multimedia(dto: dto.multimedia)
        self.propertyComment = dto.propertyComment
        self.ubication = Ubication(dto: dto.ubication)
        self.country = dto.country
        self.moreCharacteristics = MoreCharacteristics(dto: dto.moreCharacteristics)
        self.energyCertification = EnergyCertification(dto: dto.energyCertification)
    }
}

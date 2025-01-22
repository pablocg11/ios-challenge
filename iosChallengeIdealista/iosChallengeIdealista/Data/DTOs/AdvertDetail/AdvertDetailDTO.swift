//
//  AdvertDetailDTO.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 22/1/25.
//

import Foundation

struct AdvertDetailDTO: Codable {
    let adId: Int
    let price: Double
    let priceInfo: PriceInfoDetailDTO
    let operation: String
    let propertyType: String
    let extendedPropertyType: String
    let homeType: String
    let state: String
    let multimedia: MultimediaDTO
    let propertyComment: String
    let ubication: UbicationDTO
    let country: String
    let moreCharacteristics: MoreCharacteristicsDTO
    let energyCertification: EnergyCertificationDTO
    
    enum CodingKeys: String, CodingKey {
        case adId = "adid"
        case price, priceInfo, operation, propertyType, extendedPropertyType, homeType, state, multimedia, propertyComment, ubication, country, moreCharacteristics, energyCertification
    }
}

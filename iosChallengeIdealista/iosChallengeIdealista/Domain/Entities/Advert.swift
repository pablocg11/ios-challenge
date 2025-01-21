//
//  Advert.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 21/1/25.
//

import Foundation

struct Advert: Codable {
    let propertyCode: String
    let thumbnail: String
    let floor: String?
    let price: Double
    let priceInfo: PriceInfo
    let propertyType: String
    let operation: String
    let size: Double
    let exterior: Bool
    let rooms: Int
    let bathrooms: Int
    let address: String
    let province: String
    let municipality: String
    let district: String
    let country: String
    let neighborhood: String
    let latitude: Double
    let longitude: Double
    let description: String
    let multimedia: Multimedia
    let features: Features
    
    init(
        propertyCode: String,
        thumbnail: String, floor: String?,
        price: Double,
        priceInfo: PriceInfo,
        propertyType: String,
        operation: String,
        size: Double,
        exterior: Bool,
        rooms: Int,
        bathrooms: Int,
        address: String,
        province: String,
        municipality: String,
        district: String,
        country: String,
        neighborhood: String,
        latitude: Double,
        longitude: Double,
        description: String,
        multimedia: Multimedia,
        features: Features
    ) {
        self.propertyCode = propertyCode
        self.thumbnail = thumbnail
        self.floor = floor
        self.price = price
        self.priceInfo = priceInfo
        self.propertyType = propertyType
        self.operation = operation
        self.size = size
        self.exterior = exterior
        self.rooms = rooms
        self.bathrooms = bathrooms
        self.address = address
        self.province = province
        self.municipality = municipality
        self.district = district
        self.country = country
        self.neighborhood = neighborhood
        self.latitude = latitude
        self.longitude = longitude
        self.description = description
        self.multimedia = multimedia
        self.features = features
    }
    
    init(dto: AdvertDTO) {
        self.propertyCode = dto.propertyCode
        self.thumbnail = dto.thumbnail
        self.floor = dto.floor
        self.price = dto.price
        self.priceInfo = PriceInfo(dto: dto.priceInfo)
        self.propertyType = dto.propertyType
        self.operation = dto.operation
        self.size = dto.size
        self.exterior = dto.exterior
        self.rooms = dto.rooms
        self.bathrooms = dto.bathrooms
        self.address = dto.address
        self.province = dto.province
        self.municipality = dto.municipality
        self.district = dto.district
        self.country = dto.country
        self.neighborhood = dto.neighborhood
        self.latitude = dto.latitude
        self.longitude = dto.longitude
        self.description = dto.description
        self.multimedia = Multimedia(dto: dto.multimedia)
        self.features = Features(dto: dto.features)
    }
}

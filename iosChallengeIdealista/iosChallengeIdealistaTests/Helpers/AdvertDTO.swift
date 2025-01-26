//
//  AdvertDTO.swift
//  iosChallengeIdealistaTests
//
//  Created by Pablo Castro on 26/1/25.
//

import Foundation
@testable import iosChallengeIdealista

extension AdvertDTO {
    static func getMocks() -> [AdvertDTO] {
        return [
            getMockAdvertDTO1(),
            getMockAdvertDTO2(),
            getMockAdvertDTO3(),
            getMockAdvertDTO4(),
            getMockAdvertDTO5()
        ]
    }

    private static func getMockAdvertDTO1() -> AdvertDTO {
        return AdvertDTO(
            propertyCode: "A001",
            thumbnail: "https://example.com/images/property1.jpg",
            floor: "1st",
            price: 150000.0,
            priceInfo: PriceInfoItemDTO(price: PriceDTO(amount: 150000.0, currencySuffix: "€")),
            propertyType: "Flat",
            operation: "sale",
            size: 85.0,
            exterior: true,
            rooms: 3,
            bathrooms: 2,
            address: "123 Main Street",
            province: "Madrid",
            municipality: "Madrid",
            district: "Centro",
            country: "Spain",
            neighborhood: "Sol",
            latitude: 40.4168,
            longitude: -3.7038,
            description: "Beautiful flat in the heart of Madrid.",
            multimedia: MultimediaDTO(images:
                                       [ImageDTO(url: "https://example.com/images/property1_1.jpg", tag: "image 1"),
                                        ImageDTO(url: "https://example.com/images/property1_2.jpg", tag: "image 2")]
                                     ),
            features: FeaturesDTO(hasAirConditioning: true, hasBoxRoom: true)
        )
    }

    private static func getMockAdvertDTO2() -> AdvertDTO {
        return AdvertDTO(
            propertyCode: "A002",
            thumbnail: "https://example.com/images/property2.jpg",
            floor: "2nd",
            price: 950.0,
            priceInfo: PriceInfoItemDTO(price: PriceDTO(amount: 950.0, currencySuffix: "€")),
            propertyType: "Studio",
            operation: "rent",
            size: 40.0,
            exterior: false,
            rooms: 1,
            bathrooms: 1,
            address: "45 Side Avenue",
            province: "Barcelona",
            municipality: "Barcelona",
            district: "Eixample",
            country: "Spain",
            neighborhood: "Sant Antoni",
            latitude: 41.3851,
            longitude: 2.1734,
            description: "Modern studio near public transport.",
            multimedia: MultimediaDTO(images:
                                       [ImageDTO(url: "https://example.com/images/property2_1.jpg", tag: "image 1"),
                                        ImageDTO(url: "https://example.com/images/property2_2.jpg", tag: "image 2")]
                                     ),
            features: FeaturesDTO(hasAirConditioning: false, hasBoxRoom: false)
        )
    }

    private static func getMockAdvertDTO3() -> AdvertDTO {
        return AdvertDTO(
            propertyCode: "A003",
            thumbnail: "https://example.com/images/property3.jpg",
            floor: "3rd",
            price: 250000.0,
            priceInfo: PriceInfoItemDTO(price: PriceDTO(amount: 250000.0, currencySuffix: "€")),
            propertyType: "House",
            operation: "sale",
            size: 120.0,
            exterior: true,
            rooms: 4,
            bathrooms: 3,
            address: "78 Hill Road",
            province: "Valencia",
            municipality: "Valencia",
            district: "El Pla del Real",
            country: "Spain",
            neighborhood: "Mestalla",
            latitude: 39.4699,
            longitude: -0.3763,
            description: "Spacious house with garden and garage.",
            multimedia: MultimediaDTO(images:
                                       [ImageDTO(url: "https://example.com/images/property3_1.jpg", tag: "image 1"),
                                        ImageDTO(url: "https://example.com/images/property3_2.jpg", tag: "image 2")]
                                     ),
            features: FeaturesDTO(hasAirConditioning: true, hasBoxRoom: true)
        )
    }

    private static func getMockAdvertDTO4() -> AdvertDTO {
        return AdvertDTO(
            propertyCode: "A004",
            thumbnail: "https://example.com/images/property4.jpg",
            floor: "Ground",
            price: 180000.0,
            priceInfo: PriceInfoItemDTO(price: PriceDTO(amount: 180000.0, currencySuffix: "€")),
            propertyType: "Flat",
            operation: "sale",
            size: 95.0,
            exterior: true,
            rooms: 3,
            bathrooms: 2,
            address: "12 Green Lane",
            province: "Sevilla",
            municipality: "Sevilla",
            district: "Triana",
            country: "Spain",
            neighborhood: "Los Remedios",
            latitude: 37.3886,
            longitude: -5.9823,
            description: "Charming flat with modern amenities.",
            multimedia: MultimediaDTO(images:
                                       [ImageDTO(url: "https://example.com/images/property4_1.jpg", tag: "image 1"),
                                        ImageDTO(url: "https://example.com/images/property4_2.jpg", tag: "image 2")]
                                     ),
            features: FeaturesDTO(hasAirConditioning: false, hasBoxRoom: true)
        )
    }

    private static func getMockAdvertDTO5() -> AdvertDTO {
        return AdvertDTO(
            propertyCode: "A005",
            thumbnail: "https://example.com/images/property5.jpg",
            floor: "Penthouse",
            price: 320000.0,
            priceInfo: PriceInfoItemDTO(price: PriceDTO(amount: 320000.0, currencySuffix: "€")),
            propertyType: "Penthouse",
            operation: "sale",
            size: 140.0,
            exterior: true,
            rooms: 5,
            bathrooms: 4,
            address: "50 Luxury Lane",
            province: "Malaga",
            municipality: "Marbella",
            district: "Golden Mile",
            country: "Spain",
            neighborhood: "Puerto Banus",
            latitude: 36.5125,
            longitude: -4.8826,
            description: "Luxurious penthouse with stunning views.",
            multimedia: MultimediaDTO(images:
                                       [ImageDTO(url: "https://example.com/images/property5_1.jpg", tag: "image 1"),
                                        ImageDTO(url: "https://example.com/images/property5_2.jpg", tag: "image 2")]
                                     ),
            features: FeaturesDTO(hasAirConditioning: true, hasBoxRoom: false)
        )
    }
}

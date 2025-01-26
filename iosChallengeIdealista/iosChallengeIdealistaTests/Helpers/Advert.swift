//
//  Advert.swift
//  iosChallengeIdealistaTests
//
//  Created by Pablo Castro on 26/1/25.
//

import Foundation
@testable import iosChallengeIdealista

extension Advert {
    static func getMocks() -> [Advert] {
        return [
            getMockAdvert1(),
            getMockAdvert2(),
            getMockAdvert3(),
            getMockAdvert4(),
            getMockAdvert5()
        ]
    }

    private static func getMockAdvert1() -> Advert {
        return Advert(
            propertyCode: "A001",
            thumbnail: "https://example.com/images/property1.jpg",
            floor: "1st",
            price: 150000.0,
            priceInfo: PriceInfoItem(price: Price(amount: 150000.0, currencySuffix: "€")),
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
            multimedia: Multimedia(images:
                                    [ImageEntity(url: "https://example.com/images/property1_1.jpg", tag: "image 1"),
                                     ImageEntity(url: "https://example.com/images/property1_2.jpg.jpg", tag: "image 2")]
                                  ),
            features: Features(hasAirConditioning: true, hasBoxRoom: true)
        )
    }

    private static func getMockAdvert2() -> Advert {
        return Advert(
            propertyCode: "A002",
            thumbnail: "https://example.com/images/property2.jpg",
            floor: "2nd",
            price: 950.0,
            priceInfo: PriceInfoItem(price: Price(amount: 950.0, currencySuffix: "€")),
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
            multimedia: Multimedia(images:
                                    [ImageEntity(url: "https://example.com/images/property2_1.jpg", tag: "image 1"),
                                     ImageEntity(url: "https://example.com/images/property2_2.jpg.jpg", tag: "image 2")]
                                  ),
            features: Features(hasAirConditioning: false, hasBoxRoom: false)
        )
    }

    private static func getMockAdvert3() -> Advert {
        return Advert(
            propertyCode: "A003",
            thumbnail: "https://example.com/images/property3.jpg",
            floor: "3rd",
            price: 250000.0,
            priceInfo: PriceInfoItem(price: Price(amount: 250000.0, currencySuffix: "€")),
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
            multimedia: Multimedia(images:
                                    [ImageEntity(url: "https://example.com/images/property3_1.jpg", tag: "image 1"),
                                     ImageEntity(url: "https://example.com/images/property3_2.jpg", tag: "image 2")]
                                  ),
            features: Features(hasAirConditioning: true, hasBoxRoom: true)
        )
    }

    private static func getMockAdvert4() -> Advert {
        return Advert(
            propertyCode: "A004",
            thumbnail: "https://example.com/images/property4.jpg",
            floor: "Ground",
            price: 180000.0,
            priceInfo: PriceInfoItem(price: Price(amount: 180000.0, currencySuffix: "€")),
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
            multimedia: Multimedia(images:
                                    [ImageEntity(url: "https://example.com/images/property4_1.jpg", tag: "image 1"),
                                     ImageEntity(url: "https://example.com/images/property4_2.jpg", tag: "image 2")]
                                  ),
            features: Features(hasAirConditioning: false, hasBoxRoom: true)
        )
    }

    private static func getMockAdvert5() -> Advert {
        return Advert(
            propertyCode: "A005",
            thumbnail: "https://example.com/images/property5.jpg",
            floor: "Penthouse",
            price: 320000.0,
            priceInfo: PriceInfoItem(price: Price(amount: 320000.0, currencySuffix: "€")),
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
            multimedia: Multimedia(images:
                                    [ImageEntity(url: "https://example.com/images/property5_1.jpg", tag: "image 1"),
                                     ImageEntity(url: "https://example.com/images/property5_2.jpg", tag: "image 2")]
                                  ),
            features: Features(hasAirConditioning: true, hasBoxRoom: false)
        )
    }
}

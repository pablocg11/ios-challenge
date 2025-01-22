//
//  PriceInfoItem.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 21/1/25.
//

import Foundation

struct PriceInfoItem: Codable {
    let price: Price
    
    init(price: Price) {
        self.price = price
    }
    
    init(dto: PriceInfoItemDTO) {
        self.price = Price(dto: dto.price)
    }
}

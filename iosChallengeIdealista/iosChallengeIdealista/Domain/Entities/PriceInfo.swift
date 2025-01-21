//
//  PriceInfo.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 21/1/25.
//

import Foundation

struct PriceInfo: Codable {
    let price: Price
    
    init(price: Price) {
        self.price = price
    }
    
    init(dto: PriceInfoDTO) {
        self.price = Price(dto: dto.price)
    }
}

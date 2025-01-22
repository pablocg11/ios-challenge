//
//  Price.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 21/1/25.
//

import Foundation

struct Price: Codable {
    let amount: Double
    let currencySuffix: String
    
    init(amount: Double, currencySuffix: String) {
        self.amount = amount
        self.currencySuffix = currencySuffix
    }
    
    init(dto: PriceDTO) {
        self.amount = dto.amount
        self.currencySuffix = dto.currencySuffix
    }
}

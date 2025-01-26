//
//  Price.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 21/1/25.
//

import Foundation

struct Price: Hashable {
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

    var formattedPrice: String {
        let formattedAmount = NumberFormatter.priceFormatter.string(from: NSNumber(value: amount)) ?? "\(amount)"
        return "\(formattedAmount) \(currencySuffix)"
    }
}

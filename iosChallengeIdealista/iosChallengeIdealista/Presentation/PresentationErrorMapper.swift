//
//  PresentationErrorMapper.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 22/1/25.
//

import Foundation

final class PresentationErrorMapper {
    func map(error: DomainError?) -> String {
        guard error == .emptyData else {
            return "Ad information not available. Try again later"
        }

        guard error == .networkError else {
            return "A network error occurred. Try again later"
        }

        return "Something went wrong. Try again later"
    }
}

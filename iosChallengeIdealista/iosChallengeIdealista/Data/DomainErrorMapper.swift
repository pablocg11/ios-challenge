//
//  DomainErrorMapper.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 26/1/25.
//

import Foundation

final class DomainErrorMapper {
    func map(error: HTTPClientError?) -> DomainError {
        guard let error = error else {
            return .generic
        }

        switch error {
        case .noData:
            return .emptyData
        case .invalidUrl, .invalidResponse, .serverError, .tooManyRequests, .unknown:
            return .networkError
        case .parsingError, .generic:
            return .generic
        }
    }
}

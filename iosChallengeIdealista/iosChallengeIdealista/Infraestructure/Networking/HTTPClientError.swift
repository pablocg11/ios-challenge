//
//  HTTPClientError.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 21/1/25.
//

import Foundation

enum HTTPClientError: Error {
    case invalidUrl
    case invalidResponse
    case serverError(statusCode: Int)
    case tooManyRequests
    case noData
    case parsingError(Error)
    case unknown(Error)
    case generic
}

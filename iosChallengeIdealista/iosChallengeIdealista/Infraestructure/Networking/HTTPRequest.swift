//
//  HTTPRequest.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 21/1/25.
//

import Foundation

struct HTTPRequest {
    let baseUrl: String
    let path: String
    let method: HTTPMethod
    let queryParams: [String: Any]?

    init(
        baseUrl: String,
        path: String,
        method: HTTPMethod,
        body: Data? = nil,
        queryParams: [String: Any]? = nil
    ) {
        self.baseUrl = baseUrl
        self.path = path
        self.method = method
        self.queryParams = queryParams
    }
}

//
//  APIIdealistaDataSource.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 21/1/25.
//

import Foundation

protocol APIIdealistaDataSourceProtocol {
    func fetchAds() async -> Result<[AdvertDTO], HTTPClientError>
}

final class APIIdealistaDataSource: APIIdealistaDataSourceProtocol {
    private let httpClient: HTTPClientProtocol
    private let baseUrl = "https://idealista.github.io/ios-challenge"
    
    init(httpClient: HTTPClientProtocol) {
        self.httpClient = httpClient
    }
    
    func fetchAds() async -> Result<[AdvertDTO], HTTPClientError> {
        let request = HTTPRequest(baseUrl: baseUrl,
                                  path: "/list.json",
                                  method: .get)
        
        let result = await httpClient.makeRequest(request)
        switch result {
        case .success(let data):
            do {
                let adList = try JSONDecoder().decode([AdvertDTO].self, from: data)
                print(adList)
                return .success(adList)
            } catch {
                return .failure(.parsingError(error))
            }

        case .failure(let error):
            return .failure(error)
        }
    }
    
    private func handleError(error: HTTPClientError?) -> HTTPClientError {
        guard let error = error else { return .generic }
        
        return error
    }
}

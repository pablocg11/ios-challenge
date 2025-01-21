//
//  HTTPClient.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 21/1/25.
//

import Foundation

protocol HTTPClientProtocol {
    func makeRequest(_ request: HTTPRequest) async -> Result<Data, HTTPClientError>
}

final class HTTPClient: HTTPClientProtocol {
    private let session: URLSession
    private let requestBuilder: HTTPRequestBuilder
    
    init(
        session: URLSession = .shared,
         requestBuilder: HTTPRequestBuilder
    ) {
        self.session = session
        self.requestBuilder = requestBuilder
    }
    
    func makeRequest(_ request: HTTPRequest) async -> Result<Data, HTTPClientError> {
        guard let urlRequest = requestBuilder.url(request: request) else {
            return .failure(.invalidUrl)
        }
        
        do {
            let (data, response) = try await session.data(from: urlRequest)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                return .failure(.invalidResponse)
            }
            
            switch httpResponse.statusCode {
            case 200...299:
                guard !data.isEmpty else {
                    return .failure(.noData)
                }
                return .success(data)
            case 429:
                return .failure(.tooManyRequests)
            case 500...599:
                return .failure(.serverError(statusCode: httpResponse.statusCode))
            default:
                return .failure(.serverError(statusCode: httpResponse.statusCode))
            }
   
        } catch let error as URLError {
            return .failure(.unknown(error))
        } catch {
            return .failure(.unknown(error))
            
        }
    }
}

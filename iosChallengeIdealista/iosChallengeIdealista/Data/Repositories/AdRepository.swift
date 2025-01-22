//
//  AdRepository.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 21/1/25.
//

import Foundation

protocol AdRepositoryProtocol {
    func getAds() async -> Result<[Advert], DomainError>
}

final class AdRepository: AdRepositoryProtocol {
    private let apiDataSource: APIIdealistaDataSourceProtocol
    
    init(apiDataSource: APIIdealistaDataSourceProtocol) {
        self.apiDataSource = apiDataSource
    }
    
    func getAds() async -> Result<[Advert], DomainError> {
        let result = await apiDataSource.fetchAds()
        
        guard case .success(let adList) = result else {
            return .failure(.generic)
        }
        
        if adList.isEmpty {
            return .failure(.emptyData)
        }
        
        let adListDomain = adList.map { Advert(dto: $0) }
        
        return .success(adListDomain)
    }
}

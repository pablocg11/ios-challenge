//
//  AdRepository.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 21/1/25.
//

import Foundation

protocol AdRepositoryProtocol {
    func getAds() async -> Result<[Advert], DomainError>
    func getAdDetail() async -> Result<AdvertDetail, DomainError>
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
    
    func getAdDetail() async -> Result<AdvertDetail, DomainError> {
        let result = await apiDataSource.fetchAdDetail()
                
        guard case .success(let adDetail) = result else {
            return .failure(.generic)
        }
        
        let adDetailDomain = AdvertDetail(dto: adDetail)
        
        return .success(adDetailDomain)
    }
}

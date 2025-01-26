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
    private let dataSource: APIIdealistaDataSourceProtocol
    private let errorMapper: DomainErrorMapper

    init(dataSource: APIIdealistaDataSourceProtocol,
         errorMapper: DomainErrorMapper) {
        self.dataSource = dataSource
        self.errorMapper = errorMapper
    }

    func getAds() async -> Result<[Advert], DomainError> {
        let result = await dataSource.fetchAds()

        switch result {
        case .success(let adList):
            if adList.isEmpty {
                return .failure(.emptyData)
            }
            let adListDomain = adList.map { Advert(dto: $0) }
            return .success(adListDomain)

        case .failure(let httpError):
            return .failure(errorMapper.map(error: httpError))
        }
    }

    func getAdDetail() async -> Result<AdvertDetail, DomainError> {
        let result = await dataSource.fetchAdDetail()

        switch result {
        case .success(let adDetail):
            let adDetailDomain = AdvertDetail(dto: adDetail)
            return .success(adDetailDomain)

        case .failure(let httpError):
            return .failure(errorMapper.map(error: httpError))
        }
    }
}

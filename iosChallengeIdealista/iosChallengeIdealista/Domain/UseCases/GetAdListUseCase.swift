//
//  GetAdListUseCase.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 21/1/25.
//

import Foundation

protocol GetAdListUseCaseProtocol {
    func getAdList() async -> Result<[Advert], DomainError>
}

final class GetAdListUseCase: GetAdListUseCaseProtocol {
    private let repository: AdRepositoryProtocol
    
    init(repository: AdRepositoryProtocol) {
        self.repository = repository
    }
    
    func getAdList() async -> Result<[Advert], DomainError> {
        return await self.repository.getAds()
    }
}

//
//  GetAdDetailUseCase.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 22/1/25.
//

import Foundation

protocol GetAdDetailUseCaseProtocol {
    func execute() async -> Result<AdvertDetail, DomainError>
}

final class GetAdDetailUseCase: GetAdDetailUseCaseProtocol {
    private let repository: AdRepositoryProtocol

    init(repository: AdRepositoryProtocol) {
        self.repository = repository
    }

    func execute() async -> Result<AdvertDetail, DomainError> {
        return await self.repository.getAdDetail()
    }
}

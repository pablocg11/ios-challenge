//
//  AdRepositoryStub.swift
//  iosChallengeIdealistaTests
//
//  Created by Pablo Castro on 26/1/25.
//

import Foundation
@testable import iosChallengeIdealista

final class AdRepositoryStub: AdRepositoryProtocol {
    private let result: Result<[Advert], DomainError>
    private let resultDetail: Result<AdvertDetail, DomainError>

    init(result: Result<[Advert], DomainError>, resultDetail: Result<AdvertDetail, DomainError>) {
        self.result = result
        self.resultDetail = resultDetail
    }

    func getAds() async -> Result<[Advert], DomainError> {
        return self.result
    }

    func getAdDetail() async -> Result<AdvertDetail, DomainError> {
        return self.resultDetail
    }
}

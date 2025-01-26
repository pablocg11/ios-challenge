//
//  APIIdealistaDataSourceStub.swift
//  iosChallengeIdealistaTests
//
//  Created by Pablo Castro on 26/1/25.
//

import Foundation
@testable import iosChallengeIdealista

final class APIIdealistaDataSourceStub: APIIdealistaDataSourceProtocol {
    private let adList: Result<[AdvertDTO], HTTPClientError>
    private let adDetail: Result<AdvertDetailDTO, HTTPClientError>

    init(adList: Result<[AdvertDTO], HTTPClientError>, adDetail: Result<AdvertDetailDTO, HTTPClientError>) {
        self.adList = adList
        self.adDetail = adDetail
    }

    func fetchAds() async -> Result<[AdvertDTO], HTTPClientError> {
        return self.adList
    }

    func fetchAdDetail() async -> Result<AdvertDetailDTO, HTTPClientError> {
        return self.adDetail
    }
}

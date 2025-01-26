//
//  AdvertRepositoryTests.swift
//  iosChallengeIdealistaTests
//
//  Created by Pablo Castro on 26/1/25.
//

import Foundation
@testable import iosChallengeIdealista
import XCTest

final class AdvertRepositoryTests: XCTestCase {

    func test_getAdList_returns_success() async throws {
        let mockAdList = AdvertDTO.getMocks()
        let mockAdDetail = AdvertDetailDTO.getMock()

        let apiDataSourceStub = APIIdealistaDataSourceStub(
            adList: .success(mockAdList),
            adDetail: .success(mockAdDetail)
        )
        let sut = AdRepository(dataSource: apiDataSourceStub, errorMapper: DomainErrorMapper())

        let adListResult = await sut.getAds()
        let adList = try XCTUnwrap(adListResult.get(), "Expected non-nil ad list.")
        let expectedAdList = mockAdList.map { Advert(dto: $0) }

        XCTAssertEqual(adList, expectedAdList, "Ad list does not match the expected mock data.")
    }

    func test_getAdDetail_returns_success() async throws {
        let mockAdDetail = AdvertDetailDTO.getMock()

        let apiDataSourceSub = APIIdealistaDataSourceStub(
            adList: .success([]),
            adDetail: .success(mockAdDetail)
        )
        let sut = AdRepository(dataSource: apiDataSourceSub, errorMapper: DomainErrorMapper())

        let adDetailResult = await sut.getAdDetail()
        let adDetail = try XCTUnwrap(adDetailResult.get(), "Expected non-nil ad detail.")
        let expectedAdDetail = AdvertDetail(dto: mockAdDetail)

        XCTAssertEqual(adDetail, expectedAdDetail, "Ad detail does not match the expected mock data.")
    }

    func test_getAdList_returns_error_when_empty() async throws {
        let apiDataSourceSub = APIIdealistaDataSourceStub(
            adList: .success([]),
            adDetail: .success(AdvertDetailDTO.getMock())
        )
        let sut = AdRepository(dataSource: apiDataSourceSub, errorMapper: DomainErrorMapper())

        let result = await sut.getAds()

        guard case .failure(let error) = result else {
            XCTFail("Expected failure, but got success.")
            return
        }

        XCTAssertEqual(error, .emptyData, "Expected .emptyData error.")
    }

    func test_getAdList_returns_networkError() async throws {
        let apiDataSourceSub = APIIdealistaDataSourceStub(
            adList: .failure(.serverError(statusCode: 500)),
            adDetail: .success(AdvertDetailDTO.getMock())
        )
        let sut = AdRepository(dataSource: apiDataSourceSub, errorMapper: DomainErrorMapper())

        let result = await sut.getAds()

        guard case .failure(let error) = result else {
            XCTFail("Expected failure, but got success.")
            return
        }

        XCTAssertEqual(error, .networkError, "Expected .networkError.")
    }

    func test_getAdDetail_returns_parsingError() async throws {
        let apiDataSourceSub = APIIdealistaDataSourceStub(
            adList: .success([]),
            adDetail: .failure(.parsingError(NSError(domain: "Parsing", code: 1, userInfo: nil)))
        )
        let sut = AdRepository(dataSource: apiDataSourceSub, errorMapper: DomainErrorMapper())

        let result = await sut.getAdDetail()

        guard case .failure(let error) = result else {
            XCTFail("Expected failure, but got success.")
            return
        }

        XCTAssertEqual(error, .generic, "Expected .generic error for parsing.")
    }

    func test_getAdList_returns_noDataError() async throws {
        let apiDataSourceSub = APIIdealistaDataSourceStub(
            adList: .failure(.noData),
            adDetail: .success(AdvertDetailDTO.getMock())
        )
        let sut = AdRepository(dataSource: apiDataSourceSub, errorMapper: DomainErrorMapper())

        let result = await sut.getAds()

        guard case .failure(let error) = result else {
            XCTFail("Expected failure, but got success.")
            return
        }

        XCTAssertEqual(error, .emptyData, "Expected .emptyData error for noData.")
    }
}

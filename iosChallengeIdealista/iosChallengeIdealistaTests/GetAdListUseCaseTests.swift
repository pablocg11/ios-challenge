//
//  GetAdListUseCaseTests.swift
//  iosChallengeIdealistaTests
//
//  Created by Pablo Castro on 26/1/25.
//

import Foundation
@testable import iosChallengeIdealista
import XCTest

final class GetAdListUseCaseTests: XCTestCase {

    func test_execute_successfully_returns_notEmpty_array_when_repository_returns_notEmpty_array() async throws {
        let mockAdList = Advert.getMocks()
        let mockAdDetail = AdvertDetail.getMock()
        let adListResult: Result<[Advert], DomainError> = .success(mockAdList)
        let adDetailResult: Result<AdvertDetail, DomainError> = .success(mockAdDetail)

        let repositoryStub = AdRepositoryStub(result: adListResult, resultDetail: adDetailResult)
        let sut = GetAdListUseCase(repository: repositoryStub)

        let capturedResult = await sut.execute()

        let capturedAdList = try XCTUnwrap(capturedResult.get())
        XCTAssertEqual(capturedAdList, mockAdList, "Expected the returned list to match the mock data.")
    }

    func test_execute_successfully_returns_empty_array_when_repository_returns_empty_array() async throws {
        let adListResult: Result<[Advert], DomainError> = .success([])
        let adDetailResult: Result<AdvertDetail, DomainError> = .success(AdvertDetail.getMock())

        let repositoryStub = AdRepositoryStub(result: adListResult, resultDetail: adDetailResult)
        let sut = GetAdListUseCase(repository: repositoryStub)

        let capturedResult = await sut.execute()

        let capturedAdList = try XCTUnwrap(capturedResult.get())
        XCTAssertEqual(capturedAdList, [], "Expected an empty array.")
    }

    func test_execute_returns_error_when_repository_returns_error() async throws {
        let expectedError: DomainError = .networkError
        let adListResult: Result<[Advert], DomainError> = .failure(expectedError)
        let adDetailResult: Result<AdvertDetail, DomainError> = .success(AdvertDetail.getMock())

        let repositoryStub = AdRepositoryStub(result: adListResult, resultDetail: adDetailResult)
        let sut = GetAdListUseCase(repository: repositoryStub)

        let capturedResult = await sut.execute()

        guard case .failure(let error) = capturedResult else {
            XCTFail("Expected failure, but got success.")
            return
        }
        XCTAssertEqual(error, expectedError, "Expected \(expectedError), but got \(error).")
    }
}

//
//  GetAdDetailUseCase.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 26/1/25.
//

import Foundation
@testable import iosChallengeIdealista
import XCTest

final class GetAdDetailUseCaseTests: XCTestCase {

    func test_execute_successfully_returns_adDetail_when_repository_returns_adDetail() async throws {
        let mockAdDetail = AdvertDetail.getMock()
        let adDetailResult: Result<AdvertDetail, DomainError> = .success(mockAdDetail)

        let repositoryStub = AdRepositoryStub(result: .success([]), resultDetail: adDetailResult)
        let sut = GetAdDetailUseCase(repository: repositoryStub)

        let capturedResult = await sut.execute()

        let capturedAdDetail = try XCTUnwrap(capturedResult.get(), "Expected a non-nil ad detail.")
        XCTAssertEqual(capturedAdDetail, mockAdDetail, "The returned ad detail does not match the mock data.")
    }

    func test_execute_returns_error_when_repository_returns_error() async throws {
        let expectedError: DomainError = .networkError
        let adDetailResult: Result<AdvertDetail, DomainError> = .failure(expectedError)

        let repositoryStub = AdRepositoryStub(result: .success([]), resultDetail: adDetailResult)
        let sut = GetAdDetailUseCase(repository: repositoryStub)

        let capturedResult = await sut.execute()

        guard case .failure(let error) = capturedResult else {
            XCTFail("Expected failure, but got success.")
            return
        }
        XCTAssertEqual(error, expectedError, "Expected \(expectedError), but got \(error).")
    }

    func test_execute_returns_generic_error_when_repository_returns_nil_adDetail() async throws {
        let adDetailResult: Result<AdvertDetail, DomainError> = .failure(.generic)

        let repositoryStub = AdRepositoryStub(result: .success([]), resultDetail: adDetailResult)
        let sut = GetAdDetailUseCase(repository: repositoryStub)

        let capturedResult = await sut.execute()

        guard case .failure(let error) = capturedResult else {
            XCTFail("Expected failure, but got success.")
            return
        }
        XCTAssertEqual(error, .generic, "Expected .generic error for nil ad detail.")
    }
}

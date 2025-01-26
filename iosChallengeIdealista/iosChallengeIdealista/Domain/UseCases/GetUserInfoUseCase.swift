//
//  GetUserInfoUseCase.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 24/1/25.
//

import Foundation

protocol GetUserInfoUseCaseProtocol {
    func execute() async -> User?
}

final class GetUserInfoUseCase: GetUserInfoUseCaseProtocol {
    private let repository: UserRepositoryProtocol

    init(repository: UserRepositoryProtocol) {
        self.repository = repository
    }

    func execute() async -> User? {
        return await repository.getUserInfo()
    }
}

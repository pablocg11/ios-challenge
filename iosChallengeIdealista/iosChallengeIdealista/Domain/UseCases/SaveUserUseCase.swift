//
//  SaveUserUseCase.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 24/1/25.
//

import Foundation

protocol SaveUserUseCaseProtocol {
    func execute(_ userName: String) async
}

final class SaveUserUseCase: SaveUserUseCaseProtocol {
    private let repository: UserRepositoryProtocol

    init(repository: UserRepositoryProtocol) {
        self.repository = repository
    }

    func execute(_ userName: String) async {
        await self.repository.saveUserInfo(userName)
    }
}

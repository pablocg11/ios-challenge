//
//  HomeFactory.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 24/1/25.
//

import Foundation

final class HomeFactory {

    func createView() -> HomeView {
        return HomeView(viewModel: createViewModel())
    }

    private func createViewModel() -> HomeViewModel {
        return HomeViewModel(saveUserUseCase: createSaveUserUseCase(),
                             getUserInfoUseCase: createGetUserInfoUseCase())
    }

    private func createSaveUserUseCase() -> SaveUserUseCaseProtocol {
        return SaveUserUseCase(repository: createRepository())
    }

    private func createGetUserInfoUseCase() -> GetUserInfoUseCaseProtocol {
        return GetUserInfoUseCase(repository: createRepository())
    }

    private func createRepository() -> UserRepositoryProtocol {
        return UserRepository()
    }
}

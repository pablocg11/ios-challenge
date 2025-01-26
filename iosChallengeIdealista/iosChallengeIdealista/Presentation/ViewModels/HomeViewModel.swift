//
//  HomeViewModel.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 24/1/25.
//

import Foundation

final class HomeViewModel: ObservableObject {
    @Published var userName: String = ""
    @Published var isLoading: Bool = false

    private let saveUserUseCase: SaveUserUseCaseProtocol
    private let getUserInfoUseCase: GetUserInfoUseCaseProtocol

    init(saveUserUseCase: SaveUserUseCaseProtocol,
         getUserInfoUseCase: GetUserInfoUseCaseProtocol) {
        self.saveUserUseCase = saveUserUseCase
        self.getUserInfoUseCase = getUserInfoUseCase
    }

    func onAppear() {
        requestUser()
    }

    private func requestUser() {
        self.isLoading = true
        Task {
            let user = await getUserInfoUseCase.execute()
            await handleResult(user)
        }
    }

    func saveUser(_ userName: String) {
        self.isLoading = true
        Task {
            await saveUserUseCase.execute(userName)
        }
        self.isLoading = false
    }

    @MainActor
    private func handleResult(_ user: User?) {
        self.userName = user?.userName ?? ""
        self.isLoading = false
    }
}

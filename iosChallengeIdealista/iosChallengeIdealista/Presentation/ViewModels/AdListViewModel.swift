//
//  AdListViewModel.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 21/1/25.
//

import Foundation

final class AdListViewModel: ObservableObject {
    @Published var ads: [Advert] = []
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    
    private let getAdListUseCase: GetAdListUseCaseProtocol
    
    init(getAdListUseCase: GetAdListUseCaseProtocol) {
        self.getAdListUseCase = getAdListUseCase
    }
    
    func onAppear() {
        requestAds()
    }
    
    private func requestAds() {
        isLoading = true
        Task {
            let result = await getAdListUseCase.execute()
            await handleResult(result)
        }
    }
    
    @MainActor
    private func handleResult(_ result: Result<[Advert], DomainError>) async {
        switch result {
        case .success(let ads):
            self.ads = ads
            self.errorMessage = nil
        case .failure(let error):
            self.errorMessage = error.localizedDescription
        }
        self.isLoading = false
    }
}

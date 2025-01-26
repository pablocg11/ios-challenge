//
//  AdListViewModel.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 21/1/25.
//

import Foundation

class AdListViewModel: ObservableObject {
    @Published var adList: [Advert] = []
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false

    private let errorMapper: PresentationErrorMapper
    private let getAdListUseCase: GetAdListUseCaseProtocol

    init(getAdListUseCase: GetAdListUseCaseProtocol,
         errorMapper: PresentationErrorMapper) {
        self.getAdListUseCase = getAdListUseCase
        self.errorMapper = errorMapper
    }

    func onAppear() {
        isLoading = true

        Task {
            let result = await getAdListUseCase.execute()
            await handleResult(result)
        }
    }

    private func handleResult(_ result: Result<[Advert], DomainError>) async {
        switch result {
        case .success(let ads):
            Task { @MainActor in
                self.adList = ads
                self.errorMessage = nil
                self.isLoading = false
            }
        case .failure(let error):
            handleError(error)
        }
    }

    private func handleError(_ error: DomainError?) {
        Task { @MainActor in
            self.errorMessage = errorMapper.map(error: error)
            self.isLoading = false
        }
    }
}

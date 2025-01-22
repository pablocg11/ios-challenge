//
//  AdDetailViewModel.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 22/1/25.
//

import Foundation

final class AdDetailViewModel: ObservableObject {
    @Published var adDetail: AdvertDetail?
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    private let errorMapper: PresentationErrorMapper
    
    private let getAdDetailUseCase: GetAdDetailUseCaseProtocol
    
    init(getAdDetailUseCase: GetAdDetailUseCaseProtocol,
         errorMapper: PresentationErrorMapper) {
        self.getAdDetailUseCase = getAdDetailUseCase
        self.errorMapper = errorMapper
    }
    
    func onAppear() {
        requestAdDetail()
    }
    
    private func requestAdDetail() {
        self.isLoading = true
        
        Task {
            let result = await getAdDetailUseCase.execute()
            await handleResult(result)
        }
    }
    
    @MainActor
    private func handleResult(_ result: Result<AdvertDetail, DomainError>) async {
        switch result {
        case .success(let adDetail):
            self.adDetail = adDetail
            self.errorMessage = nil
        case .failure(let error):
            handleError(error: error)
        }
        self.isLoading = false
    }
    
    @MainActor
    private func handleError(error: DomainError?) {
        self.isLoading = false
        self.errorMessage = errorMapper.map(error: error)
    }
}

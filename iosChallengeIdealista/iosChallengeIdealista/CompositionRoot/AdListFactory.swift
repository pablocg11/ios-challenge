//
//  AdListFactory.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 22/1/25.
//

import Foundation

final class AdListFactory {
    
    func createView() -> AdListView {
        return AdListView(viewModel: createViewModel())
    }
    
    private func createViewModel() -> AdListViewModel {
        return AdListViewModel(getAdListUseCase: createAdListUseCase())
    }
    
    private func createAdListUseCase() -> GetAdListUseCaseProtocol {
        return GetAdListUseCase(repository: createRepository())
    }
    
    private func createRepository() -> AdRepositoryProtocol {
        return AdRepository(apiDataSource: createApiDataSource())
    }
    
    private func createApiDataSource() -> APIIdealistaDataSourceProtocol {
        return APIIdealistaDataSource(httpClient: createHTTPClient())
    }
    
    private func createHTTPClient() -> HTTPClientProtocol {
        return HTTPClient(requestBuilder: HTTPRequestBuilder())
    }
}

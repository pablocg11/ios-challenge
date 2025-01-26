//
//  AdListFactory.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 22/1/25.
//

import Foundation

final class AdListFactory {
    private lazy var viewModel: AdListViewModel = {
            return AdListViewModel(
                getAdListUseCase: createGetAdListUseCase(),
                errorMapper: createErrorMapper()
            )
        }()

    func createView(userName: String) -> AdListView {
        return AdListView(viewModel: viewModel,
                          userName: userName,
                          favoriteAdManager: createFavoriteAdManager())
    }

    private func createFavoriteAdManager() -> FavoriteAdManager {
        return FavoriteAdManager()
    }

    private func createGetAdListUseCase() -> GetAdListUseCaseProtocol {
        return GetAdListUseCase(repository: createRepository())
    }

    private func createRepository() -> AdRepositoryProtocol {
        return AdRepository(dataSource: createApiDataSource())
    }

    private func createApiDataSource() -> APIIdealistaDataSourceProtocol {
        return APIIdealistaDataSource(httpClient: createHTTPClient())
    }

    private func createHTTPClient() -> HTTPClientProtocol {
        return HTTPClient(requestBuilder: HTTPRequestBuilder())
    }

    private func createErrorMapper() -> PresentationErrorMapper {
        return PresentationErrorMapper()
    }
}

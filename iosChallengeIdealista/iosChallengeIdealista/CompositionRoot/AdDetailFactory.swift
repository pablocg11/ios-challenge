//
//  AdDetailFactory.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 22/1/25.
//

final class AdDetailFactory {

    func createView() -> AdDetailView {
        return AdDetailView(viewModel: createViewModel())
    }

    private func createViewModel() -> AdDetailViewModel {
        return AdDetailViewModel(getAdDetailUseCase: createGetAdDetailUseCase(),
                                 errorMapper: PresentationErrorMapper())
    }

    private func createGetAdDetailUseCase() -> GetAdDetailUseCaseProtocol {
        return GetAdDetailUseCase(repository: createRepository())
    }

    private func createRepository() -> AdRepositoryProtocol {
        return AdRepository(dataSource: createApiDataSource(),
                            errorMapper: DomainErrorMapper())
    }

    private func createApiDataSource() -> APIIdealistaDataSourceProtocol {
        return APIIdealistaDataSource(httpClient: createHTTPClient())
    }

    private func createHTTPClient() -> HTTPClientProtocol {
        return HTTPClient(requestBuilder: HTTPRequestBuilder())
    }
}

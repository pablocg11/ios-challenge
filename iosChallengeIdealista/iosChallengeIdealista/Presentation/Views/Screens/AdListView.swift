//
//  AdListView.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 22/1/25.
//

import SwiftUI

struct AdListView: View {
    @ObservedObject var viewModel: AdListViewModel
    @ObservedObject var favoriteAdManager: FavoriteAdManager
    var userName: String
    @State private var selectedItem: Int = 0

    init(viewModel: AdListViewModel,
         userName: String,
         favoriteAdManager: FavoriteAdManager) {
        self.viewModel = viewModel
        self.userName = userName
        self.favoriteAdManager = favoriteAdManager
    }

    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
                    .padding()
            } else if let error = viewModel.errorMessage {
                VStack(spacing: 20) {
                    Image(systemName: "exclamationmark.circle")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(Constants.AppColors.primary)
                    Text(error)
                        .font(.subheadline)
                        .foregroundStyle(.secondaryText)
                }
            } else {
                WelcomeView(userName: userName)
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .center) {
                        CustomTopBar(selectedItem: $selectedItem)
                        if filteredAds().isEmpty {
                            EmptyResultView()
                        } else {
                            ScrollView {
                                ForEach(filteredAds(), id: \.propertyCode) { advert in
                                    VStack(alignment: .leading, spacing: 10) {
                                        if let favoriteDate = advert.favoriteDateFormatted {
                                            FavoriteAdDate(favoriteDate: favoriteDate)
                                        }
                                        NavigationLink(destination: AdDetailFactory().createView()) {
                                            AdItemView(
                                                advert: advert,
                                                isFavorite: favoriteAdManager.isFavorite(advert),
                                                toggleFavorite: {
                                                    favoriteAdManager.toggleFavorite(advert)
                                                    if favoriteAdManager.isFavorite(advert) {
                                                        triggerHapticFeedback()
                                                    }
                                                }
                                            )
                                            .transition(.opacity.combined(with: .slide))
                                            .animation(.easeInOut(duration: 0.3), value: filteredAds())
                                        }
                                    }
                                }
                            }
                            .refreshable {
                                viewModel.onAppear()
                            }
                            .scrollIndicators(.hidden)
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            viewModel.onAppear()
        }
    }

    private func filteredAds() -> [Advert] {
        switch selectedItem {
        case 0:
            return viewModel.adList
        case 1:
            return viewModel.adList.filter { $0.operation == "sale" }
        case 2:
            return viewModel.adList.filter { $0.operation == "rent" }
        case 3:
            return favoriteAdManager.favoriteAds
        default:
            return []
        }
    }

    private func triggerHapticFeedback() {
        UINotificationFeedbackGenerator().notificationOccurred(.success)
    }
}

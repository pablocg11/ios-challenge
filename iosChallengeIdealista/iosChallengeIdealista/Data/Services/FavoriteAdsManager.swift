//
//  FavoriteAdsManager.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 24/1/25.
//

import Foundation

final class FavoriteAdManager: ObservableObject {
    @Published private(set) var favoriteAds: [Advert] = []

    func isFavorite(_ advert: Advert) -> Bool {
        favoriteAds.contains(where: { $0.propertyCode == advert.propertyCode })
    }

    func addFavorite(_ advert: Advert) {
        guard !isFavorite(advert) else { return }

        var updatedAdvert = advert
        updatedAdvert.favoriteDate = Date()
        favoriteAds.append(updatedAdvert)
    }

    func removeFavorite(_ advert: Advert) {
        favoriteAds.removeAll(where: { $0.propertyCode == advert.propertyCode })
    }

    func toggleFavorite(_ advert: Advert) {
        if isFavorite(advert) {
            removeFavorite(advert)
        } else {
            addFavorite(advert)
        }
    }
}

//
//  FavoriteAdDate.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 24/1/25.
//

import SwiftUI

struct FavoriteAdDate: View {
    var favoriteDate: String

    var body: some View {
        Text("favorite_since \(favoriteDate)")
            .foregroundStyle(.secondaryText)
            .font(.caption2)
        .padding(8)
        .background(Constants.AppColors.secondaryLightOpacity)
        .cornerRadius(8)
        .padding(2)
    }
}

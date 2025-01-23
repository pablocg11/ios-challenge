//
//  FavoriteButton.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 22/1/25.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isFavorite: Bool
    var body: some View {
        ZStack {
            Circle()
                .fill(Constants.AppColors.secondaryOpacity)
                .frame(width: 45, height: 45)
            Button(action: {
                isFavorite.toggle()
            }, label: {
                Image(systemName: isFavorite ? "heart.fill" :"heart")
                    .foregroundStyle(Constants.AppColors.secondaryText)
                    .frame(width: 25, height: 25)
            })
        }
    }
}

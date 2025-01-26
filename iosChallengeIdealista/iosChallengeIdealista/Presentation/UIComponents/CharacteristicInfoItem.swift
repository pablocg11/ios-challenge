//
//  CharacteristicInfoItem.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 22/1/25.
//

import SwiftUI

struct CharacteristicInfoItem: View {
    var image: String
    var data: String
    var dataDetail: LocalizedStringKey

    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: image)
                .frame(height: 5)
                .foregroundStyle(.secondaryText)
            HStack(spacing: 2) {
                Text(data)
                    .font(.caption2)
                    .foregroundStyle(.secondaryText)
                Text(dataDetail)
                    .font(.caption2)
                    .foregroundStyle(.secondaryText)
            }
        }
        .padding(8)
        .background(Constants.AppColors.secondaryOpacity)
        .cornerRadius(8)
    }
}

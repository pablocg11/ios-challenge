//
//  InfoCard.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 23/1/25.
//

import SwiftUI

struct InfoCard: View {
    let title: LocalizedStringKey
    let details: [String]?
    let detailDescriptions: [LocalizedStringKey]

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.caption)
                    .foregroundStyle(.primaryText)
                VStack(alignment: .leading, spacing: 4) {
                    ForEach(detailDescriptions.indices, id: \.self) { index in
                        HStack(spacing: 2) {
                            Text(details?[index] ?? "")
                                .font(.caption2)
                                .foregroundStyle(.secondaryText)
                            Text(detailDescriptions[index])
                                .font(.caption)
                                .foregroundStyle(.secondaryText)
                        }
                    }
                }
                Spacer()
            }
            Spacer()
        }
        .frame(maxWidth: 180, maxHeight: 180)
        .padding(10)
        .background(Constants.AppColors.secondaryMediumOpacity)
        .cornerRadius(8)
    }
}

//
//  DescriptionDetailView.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 23/1/25.
//

import SwiftUI

struct DescriptionDetailView: View {
    var advert: AdvertDetail
    @State var expandDescription: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("description")
                .font(.system(size: 14))
                .foregroundStyle(.primaryText)
            Text(advert.propertyComment)
                .font(.caption)
                .foregroundStyle(.secondaryText)
            .lineLimit(expandDescription ? nil : 10)
            .truncationMode(.tail)
        }
        .padding(8)
        .background(Constants.AppColors.secondaryMediumOpacity)
        .cornerRadius(8)
        .onTapGesture {
            expandDescription.toggle()
        }
    }
}

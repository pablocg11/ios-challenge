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
            MainText(text: "Descripción",
                     font: .caption)
            MainText(text: advert.propertyComment,
                     font: .caption2,
                     color: .secondaryText)
            .lineLimit(expandDescription ? nil : 10)
            .truncationMode(.tail)
        }
        .padding(8)
        .background(Constants.AppColors.secondaryOpacity)
        .cornerRadius(8)
        .onTapGesture {
            expandDescription.toggle()
        }
    }
}

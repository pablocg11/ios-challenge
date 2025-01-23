//
//  CharacteristicInfoItem.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 22/1/25.
//

import SwiftUI

struct CharacteristicInfoItem: View {
    var image: String
    var text: String
    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: image)
                .frame(height: 5)
                .foregroundStyle(.secondaryText)
            MainText(text: text,
                     font: .caption2,
                     color: .secondaryText)
        }
        .padding(8)
        .background(Constants.AppColors.secondaryOpacity)
        .cornerRadius(8)
    }
}

#Preview {
    CharacteristicInfoItem(image: "camera.metering.center.weighted.average",
                           text:  "200 m²")
}

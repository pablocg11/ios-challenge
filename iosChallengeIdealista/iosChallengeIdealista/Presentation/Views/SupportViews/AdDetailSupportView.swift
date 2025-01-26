//
//  AdDetailView2.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 22/1/25.
//

import SwiftUI

struct AdDetailSupportView: View {
    var advert: AdvertDetail

    var body: some View {
        ScrollView {
            if !advert.multimedia.images.isEmpty {
                ImageCarousel(images: advert.multimedia.images)
            }

            VStack(alignment: .leading, spacing: 20) {
                HStack(spacing: 4) {
                    Text(advert.operationFormatted)
                        .font(.system(size: 16))
                        .foregroundStyle(.secondaryText)
                        .fontWeight(.semibold)

                    Text(advert.propertyTypeFormatted)
                        .font(.system(size: 16))
                        .foregroundStyle(.secondaryText)
                        .fontWeight(.semibold)

                    Text(advert.priceInfo.formattedPrice)
                        .font(.system(size: 16))
                        .foregroundStyle(.secondaryText)
                        .fontWeight(.semibold)
                }

                MoreCharacteristicSectionView(advert: advert)

                DescriptionDetailView(advert: advert)

                MapView(advert: advert)
            }
            .padding(10)

            Spacer()
        }
        .scrollIndicators(.hidden)
    }
}

//
//  AdItemView.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 22/1/25.
//

import SwiftUI

struct AdItemView: View {
    var advert: Advert
    var isFavorite: Bool
    var toggleFavorite: () -> Void

    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .topTrailing) {
                if let url = URL(string: advert.thumbnail) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .cornerRadius(10)
                    } placeholder: {
                        ProgressView()
                    }
                } else {
                    Rectangle()
                        .fill(Constants.AppColors.grayOpacity)
                        .cornerRadius(10)
                }

                VStack {
                    HStack {
                        Text(advert.operationFormatted)
                            .foregroundStyle(.primaryText)
                            .font(.footnote)
                            .padding(8)
                            .background(Constants.AppColors.secondaryOpacity)
                            .cornerRadius(8)
                        Spacer()
                        FavoriteButton(isFavorite: isFavorite)
                            .onTapGesture {
                                toggleFavorite()
                            }
                    }
                    .padding(15)

                    Spacer()

                    VStack(alignment: .leading, spacing: 15) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(advert.propertyTypeFormatted)
                                    .foregroundStyle(.primaryText)
                                    .fontWeight(.semibold)
                                Text("\(advert.address), \(advert.neighborhood), \(advert.municipality)")
                                    .font(.caption)
                                    .foregroundStyle(.secondaryText)
                            }
                            Spacer()
                            Text(advert.priceInfo.price.formattedPrice)
                                .foregroundStyle(.secondaryText)
                                .fontWeight(.bold)
                                .font(.headline)
                        }
                        characterInfoItemsView()
                    }
                    .padding(10)
                    .background(Constants.AppColors.systemBackgroundOpacity)
                }
            }
        }
        .padding(5)
        .frame(height: 300)
    }

    private func characterInfoItemsView() -> some View {
        return HStack(spacing: 10) {
            Spacer()
            CharacteristicInfoItem(
                image: "door.left.hand.open",
                data: "\(advert.rooms)",
                dataDetail: "rooms"
            )
            CharacteristicInfoItem(
                image: "building",
                data: "\(advert.floor)",
                dataDetail: "floor"
            )
            CharacteristicInfoItem(
                image: "camera.metering.center.weighted.average",
                data: "\(advert.size)",
                dataDetail: "constructed_area"
            )
            Spacer()
        }
    }
}

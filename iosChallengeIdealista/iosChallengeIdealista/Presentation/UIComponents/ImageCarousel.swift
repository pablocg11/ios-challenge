//
//  ImageCarousel.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 22/1/25.
//

import SwiftUI

struct ImageCarousel: View {
    var images: [ImageEntity]
    @State private var screenSize = UIScreen.main.bounds
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(Array(images.enumerated()), id: \.element) { index, image in
                    ZStack(alignment: .topLeading) {
                        AsyncImage(url: URL(string: image.url)) { loadedImage in
                            loadedImage
                                .resizable()
                                .scaledToFit()
                                .clipped()

                        } placeholder: {
                            ProgressView()
                        }
                        Text("\(index + 1)/\(images.count)")
                            .font(.caption)
                            .foregroundStyle(.secondaryText)
                        .padding(8)
                        .background(Constants.AppColors.systemBackgroundOpacity)
                        .cornerRadius(10)
                        .padding()
                    }
                    .frame(width: screenSize.width)
                }
            }
        }
    }
}

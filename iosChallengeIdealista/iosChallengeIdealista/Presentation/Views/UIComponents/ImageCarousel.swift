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
                        
                        MainText(text: "\(index + 1)/\(images.count)",
                                 font: .caption,
                                 color: .secondaryText)
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

#Preview {
    ImageCarousel(images: [
        ImageEntity(url: "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/58/60/32/1273036727.webp", tag: "livingRoom"),
        ImageEntity(url: "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/a1/0f/ee/1273036728.webp", tag: "unknown"),
        ImageEntity(url: "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/79/6b/e0/1273036729.webp", tag: "views"),
        ImageEntity(url: "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/00/c5/91/1273036730.webp", tag: "facade"),
        ImageEntity(url: "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/c8/fe/3e/1273036731.webp", tag: "livingRoom"),
        ImageEntity(url: "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/f6/5e/9b/1273036732.webp", tag: "livingRoom"),
        ImageEntity(url: "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/86/b1/b0/1273036733.webp", tag: "livingRoom"),
        ImageEntity(url: "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/7d/e1/66/1273036734.webp", tag: "livingRoom"),
        ImageEntity(url: "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/20/f2/79/1273036794.webp", tag: "communalareas"),
        ImageEntity(url: "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/a5/dc/82/1273036797.webp", tag: "communalareas"),
        ImageEntity(url: "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/f3/d4/df/1273036798.webp", tag: "communalareas"),
        ImageEntity(url: "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/6b/39/a4/1273036799.webp", tag: "communalareas"),
        ImageEntity(url: "https://img4.idealista.com/blur/WEB_DETAIL-L-L/0/id.pro.es.image.master/81/72/2d/1273036800.webp", tag: "communalareas")
    ])
}

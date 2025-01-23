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
            
            VStack(alignment: .leading, spacing: 20){
                MainText(text: "\(advert.extendedPropertyTypeFormatted) \(advert.operationFormatted) \(advert.priceInfo.formattedPrice)",
                         font: .title3,
                         color: .primaryText)
                
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

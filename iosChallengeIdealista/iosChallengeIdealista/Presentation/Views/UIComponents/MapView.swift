//
//  MapView.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 22/1/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    var advert: AdvertDetail
    var body: some View {
        ZStack(alignment: .topLeading){
            Map {
                Marker("Localización",coordinate: CLLocationCoordinate2D(latitude: advert.ubication.latitude,
                                                          longitude: advert.ubication.longitude))
                .tint(Constants.AppColors.primary)
            }
            MainText(text: "Ubicación",
                     font: .caption,
                     color: .primaryText)
            .padding(8)
            .background(Constants.AppColors.secondaryLightOpacity)
            .cornerRadius(8)
            .padding(8)
        }
        .cornerRadius(8)
        .frame(height: 250)
    }
}

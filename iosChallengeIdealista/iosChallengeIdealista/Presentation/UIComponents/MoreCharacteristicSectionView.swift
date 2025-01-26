//
//  MoreCharacteristicSectionView.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 23/1/25.
//

import SwiftUI

struct MoreCharacteristicSectionView: View {
    var advert: AdvertDetail
    let columns = [
            GridItem(.flexible(maximum: 180), spacing: 5),
            GridItem(.flexible(maximum: 180), spacing: 5)
        ]

    var body: some View {
        LazyVGrid(columns: columns) {
            InfoCard(
                title: "basic_properties",
                details: [
                    "\(advert.moreCharacteristics.constructedArea)",
                    "\(advert.moreCharacteristics.roomNumber)",
                    "\(advert.moreCharacteristics.bathNumber)"
                ],
                detailDescriptions: [
                    "constructed_area",
                    "rooms",
                    "bathrooms"
                ]
            )

            InfoCard(
                title: "building",
                details: [
                    "\(advert.moreCharacteristics.floor)",
                    advert.moreCharacteristics.formattedModificationDate
                ],
                detailDescriptions: [
                    "floor",
                    "last_modification"
                ]
            )

            InfoCard(
                title: "equipment",
                details: nil,
                detailDescriptions: [
                    advert.moreCharacteristics.lift ? "with_lift" : "without_lift",
                    advert.moreCharacteristics.boxroom ? "with_boxroom" : "without_boxroom",
                    advert.moreCharacteristics.agencyIsABank ? "bank_management" : "private"
                ]
            )

            InfoCard(
                title: "energy_certificate",
                details: [
                    "\(advert.moreCharacteristics.energyCertificationType)",
                    "\(advert.moreCharacteristics.energyCertificationType)"
                ],
                detailDescriptions: [
                    "consumption",
                    "emissions"
                ]
            )
        }
    }
}

//
//  MoreCharacteristicSectionView.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 23/1/25.
//

import SwiftUI

struct MoreCharacteristicSectionView: View {
    var advert: AdvertDetail
    let rows = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        LazyHGrid(rows: rows) {
            InfoCard(title: "Características básicas", details: [
                "\(advert.moreCharacteristics.constructedArea) m² construidos",
                "\(advert.moreCharacteristics.roomNumber) habitaciones",
                "\(advert.moreCharacteristics.bathNumber) baños",
                advert.moreCharacteristics.exterior ? "Con terraza" : "Sin terraza"
            ])
            
            InfoCard(title: "Edificio", details: [
                advert.moreCharacteristics.lift ? "Con ascensor" : "Sin ascensor",
                advert.moreCharacteristics.isDuplex ? "Dúplex" : "No es dúplex",
                "Planta \(advert.moreCharacteristics.floor)",
                advert.moreCharacteristics.flatLocation
            ])
            
            InfoCard(title: "Equipamiento", details: [
                advert.moreCharacteristics.boxroom ? "Con trastero" : "Sin trastero",
                advert.moreCharacteristics.housingFurnitures,
                advert.moreCharacteristics.agencyIsABank ? "Gestión bancaria" : "Particular"
            ])
            
            InfoCard(title: "Certificado energético", details: [
                "Consumo: \(advert.energyCertification.energyConsumption.type)",
                "Emisiones: \(advert.energyCertification.energyConsumption.type)"
            ])
        }
        .frame(maxWidth: .infinity)
    }
}

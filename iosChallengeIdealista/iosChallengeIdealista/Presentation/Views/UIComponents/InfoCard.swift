//
//  InfoCard.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 23/1/25.
//

import SwiftUI

struct InfoCard: View {
    let title: String
    let details: [String]

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                MainText(text: title, font: .system(size: 14), color: .primaryText)
                
                VStack(alignment: .leading, spacing: 4){
                    ForEach(details, id: \.self) { detail in
                        MainText(text: detail, font: .caption, color: .secondaryText)
                    }
                }
                Spacer()
            }
            Spacer()
        }
        .padding(10)
        .background(Constants.AppColors.secondaryOpacity)
        .cornerRadius(8)
    }
}


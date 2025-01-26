//
//  WelcomeView.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 23/1/25.
//

import SwiftUI

struct WelcomeView: View {
    var userName: String

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("welcome_title \(userName)")
                .font(.title)
                .foregroundStyle(.primaryText)
            Text("welcome_message")
                .font(.title2)
                .foregroundStyle(.secondaryText)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

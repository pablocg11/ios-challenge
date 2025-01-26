//
//  EmptyResultView.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 23/1/25.
//

import SwiftUI

struct EmptyResultView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Spacer()
            Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width: 50, height: 50)
                .foregroundColor(Constants.AppColors.primary)
            Text("no_result_found")
                .font(.subheadline)
                .foregroundStyle(.secondaryText)
            .padding()
            Spacer()
        }
    }
}

#Preview {
    EmptyResultView()
}

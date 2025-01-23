//
//  AdDetailView.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 22/1/25.
//

import SwiftUI

struct AdDetailView: View {
    @ObservedObject var viewModel: AdDetailViewModel
    
    init(viewModel: AdDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
                    .padding()
            }
            else if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundStyle(.red)
            }
            else {
                if let adDetail = viewModel.adDetail {
                    AdDetailSupportView(advert: adDetail)
                }
                else {
                    Text("No detail found")
                }
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

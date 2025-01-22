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
        NavigationView {
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
                    Text(adDetail.propertyComment)
                        .font(.callout)
                        .lineLimit(3)
                        .truncationMode(.tail)
                        .padding()
                }
                else {
                    Text("No detail found")
                }
            }
        }
        .navigationTitle("Ad detail")
        .onAppear {
            viewModel.onAppear()
        }
    }
}

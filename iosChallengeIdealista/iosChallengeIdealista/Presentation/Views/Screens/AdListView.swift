//
//  AdListView.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 22/1/25.
//

import SwiftUI

struct AdListView: View {
    @ObservedObject var viewModel: AdListViewModel
    
    init(viewModel: AdListViewModel) {
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
                VStack(alignment: .leading) {
                    ScrollView {
                        ForEach(viewModel.ads, id: \.propertyCode) { ad in
                            Text(ad.description)
                                .font(.callout)
                                .lineLimit(3)
                                .truncationMode(.tail)
                                .padding()
                        }
                    }
                    .scrollIndicators(.hidden)
                }
            }
        }
        .navigationTitle("Ad list")
        .onAppear {
            viewModel.onAppear()
        }
    }
}

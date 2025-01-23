//
//  AdListView.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 22/1/25.
//

import SwiftUI

struct AdListView: View {
    @ObservedObject var viewModel: AdListViewModel
    @State private var selectedItem: Int = 0
    private let categories = ["All", "For sale", "For rent"]
    
    init(viewModel: AdListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            if viewModel.isLoading {
                ProgressView()
                    .padding()
            }
            else if let error = viewModel.errorMessage {
                Text(error)
                    .foregroundStyle(.red)
            }
            else {
                VStack(alignment: .leading, spacing: 20) {
                    VStack(alignment: .leading, spacing: 5){
                        HStack(spacing: 2) {
                            MainText(text: "Hi, ",
                                     font: .title,
                                     color: .primaryText)
                            MainText(text: "User",
                                     font: .title,
                                     color: .primaryText,
                                     fontWeight: .bold)
                        }
                        MainText(text: "Welcome back!",
                                 font: .title2,
                                 color: .secondaryText)
                    }
                    .padding(.horizontal)
                    VStack(alignment: .center){
                        CustomTopBar(selectedItem: $selectedItem, options: categories)
                        ScrollView {
                            VStack(alignment: .leading, spacing: 10) {
                                if filteredAds().isEmpty {
                                    MainText(text: "No results found",
                                             font: .subheadline,
                                             color: .primaryText)
                                    .padding()
                                }
                                else{
                                    ForEach(filteredAds().indices, id: \.self) { index in
                                        let ad = filteredAds()[index]
                                        NavigationLink(destination: AdDetailFactory().createView()){
                                            AdItemView(advert: ad)
                                        }
                                    }
                                }
                            }
                        }
                        .refreshable {
                            viewModel.onAppear()
                        }
                        .scrollIndicators(.hidden)
                    }
                }
            }
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
    
    private func filteredAds() -> [Advert] {
        switch selectedItem {
        case 0:
            return viewModel.ads
        case 1:
            return viewModel.ads.filter { $0.operation == "Sale" }
        case 2:
            return viewModel.ads.filter { $0.operation == "Rent" }
        default:
            return []
        }
    }
}

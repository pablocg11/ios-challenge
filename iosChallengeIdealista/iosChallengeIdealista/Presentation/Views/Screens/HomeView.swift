//
//  HomeView.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 24/1/25.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    private let adListFactory: AdListFactory = AdListFactory()
    @State private var navigate = false

    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            Spacer()
            if viewModel.isLoading {
                ProgressView()
                    .scaleEffect(1.5)
                    .padding()
            } else {
                content
            }
            Spacer()
        }
        .navigationDestination(isPresented: $navigate) {
            adListFactory.createView(userName: viewModel.userName)
        }
        .foregroundStyle(Constants.AppColors.primary)
        .padding()
        .onAppear {
            viewModel.onAppear()
        }
    }

    private var content: some View {
        VStack(spacing: 80) {
            Image("idealistaLogo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 180)
                .cornerRadius(10)

            VStack(alignment: .leading, spacing: 8) {
                Text("user_name")
                    .font(.caption)
                HStack {
                    TextField("enter_user_name", text: $viewModel.userName)
                        .padding(15)
                        .foregroundStyle(.secondaryText)
                        .background(Constants.AppColors.secondaryOpacity)
                        .cornerRadius(8)
                        .onSubmit {
                            handleAction()
                        }

                    Button(action: {
                        handleAction()
                    }, label: {
                        Image(systemName: "arrow.right.circle")
                            .resizable()
                            .frame(maxWidth: 30, maxHeight: 30)
                            .padding(10)
                            .foregroundStyle(viewModel.userName.isEmpty ?
                                             Constants.AppColors.secondary :
                                             Constants.AppColors.primary)
                    })
                    .disabled(viewModel.userName.isEmpty)
                }
            }
        }
    }

    private func handleAction() {
        if !viewModel.userName.isEmpty {
            viewModel.saveUser(viewModel.userName)
            navigate = true
        }
    }
}

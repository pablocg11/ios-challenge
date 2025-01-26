//
//  ContentView.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 15/1/25.
//

import SwiftUI

struct ContentView: View {
    private let homeView: HomeView

    init(homeView: HomeView) {
        self.homeView = homeView
    }

    var body: some View {
        NavigationStack {
            homeView
        }
    }
}

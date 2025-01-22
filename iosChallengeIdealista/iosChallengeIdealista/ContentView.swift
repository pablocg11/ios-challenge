//
//  ContentView.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 15/1/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            AdListFactory().createView()
        }
    }
}

#Preview {
    ContentView()
}

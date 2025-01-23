//
//  SkeletonLoading.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 22/1/25.
//

import SwiftUI
import Lottie

struct SkeletonLoading: View {
    var body: some View {
        LottieView(animation: .named("skeleton_loading"))
                                .configure(\.contentMode, to: .scaleAspectFit)
                                .playing(loopMode: .loop)
                                .animationSpeed(0.8)
    }
}

#Preview {
    SkeletonLoading()
}

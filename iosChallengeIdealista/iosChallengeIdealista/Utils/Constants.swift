//
//  Constants.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 22/1/25.
//

import Foundation
import SwiftUI

struct Constants {

    // MARK: - Colors
    struct AppColors {
        static let primary = Color("AppPrimaryColor")
        static let secondary = Color("AppSecondaryColor")
        static let white = Color.white
        static let gray = Color.gray

        static let primaryText = Color("PrimaryTextColor")
        static let secondaryText = Color("SecondaryTextColor")

        static let grayOpacity = gray.opacity(0.3)
        static let secondaryOpacity = secondary.opacity(0.75)
        static let secondaryMediumOpacity = secondary.opacity(0.5)
        static let secondaryLightOpacity = secondary.opacity(0.3)
        static let systemBackgroundOpacity = Color(.systemBackground).opacity(0.65)
    }
}

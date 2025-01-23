//
//  MainText.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 22/1/25.
//

import SwiftUI

import SwiftUI

struct MainText: View {
    var text: String
    var font: Font?
    var color: Color?
    var fontWeight: Font.Weight?
    var body: some View {
        Text(text)
            .font(font ?? .callout)
            .fontWeight(fontWeight ?? .regular)
            .foregroundStyle(color ?? Constants.AppColors.primaryText)
    }
}

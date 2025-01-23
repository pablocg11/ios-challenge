//
//  CustomTopBar.swift
//  iosChallengeIdealista
//
//  Created by Pablo Castro on 22/1/25.
//

import SwiftUI

struct CustomTopBar: View {
    @Binding var selectedItem: Int
    var options: [String]
        
    var body: some View {
        HStack(spacing: 40) {
            Spacer()
            ForEach(0..<options.count, id: \.self) { index in
                VStack(spacing: 5) {
                    Circle()
                        .fill(selectedItem == index ? Constants.AppColors.primary : Color.clear)
                        .frame(width: 5, height: 5)
                        .animation(.easeInOut(duration: 0.3), value: selectedItem)
                    
                    Button(action: {
                        selectedItem = index
                    }, label: {
                        MainText(text: options[index],
                                 font: .caption,
                                 color: selectedItem == index ? .primaryText : .secondaryText,
                                 fontWeight: selectedItem == index ? .bold : .regular)
                    })
                    .scaleEffect(selectedItem == index ? 1.1 : 1.0)
                    .animation(.spring(response: 0.4, dampingFraction: 0.6, blendDuration: 0.5), value: selectedItem)
                }
            }
            Spacer()
        }
        .padding(15)
        .background(Constants.AppColors.secondaryMediumOpacity)
        .cornerRadius(8)
    }
}

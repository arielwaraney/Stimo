//
//  Button Styles.swift
//  Stimo
//
//  Created by Ariel Waraney on 21/07/22.
//

import SwiftUI

struct YellowMain: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 160, height: 39)
            .foregroundColor(Color(hex: 0x484747))
            .background(.yellow)
            .cornerRadius(100)
    }
}

struct WhiteSmall: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 72, height: 34)
            .foregroundColor(Color(hex: 0x484747))
            .background(.white)
            .cornerRadius(100)
    }
}

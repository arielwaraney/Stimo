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
            .foregroundColor(Color("GreyOne"))
            .background(Color("YellowOne"))
            .cornerRadius(100)
    }
}

struct WhiteSmall: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 72, height: 34)
            .foregroundColor(Color("GreyOne"))
            .background(.white)
            .cornerRadius(100)
    }
}

struct YellowOne: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 137, height: 39)
            .foregroundColor(Color("GreyOne"))
            .background(Color("YellowOne"))
            .cornerRadius(100)
    }
}

struct YellowTwo: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 137, height: 39)
            .foregroundColor(Color("GreyOne"))
            .background(Color("YellowTwo"))
            .cornerRadius(100)
    }
}

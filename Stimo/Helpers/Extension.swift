//
//  Button Styles.swift
//  Stimo
//
//  Created by Ariel Waraney on 21/07/22.
//

import SwiftUI

// MARK: - Color Extensions

func getColorOne(color: Color)-> String {
    switch color {
    case .red:
        return "red-1"
    case .yellow:
        return "yellow-1"
    case .green:
        return "green-1"
    case .blue:
        return "blue-1"
    case .purple:
        return "purple-1"
    case .white:
        return "white"
    case .black:
        return "black"
    default:
        return "GreyTwo"
    }
}

func getColorTwo(color: Color)-> String {
    switch color {
    case .red:
        return "red-2"
    case .yellow:
        return "yellow-2"
    case .green:
        return "green-2"
    case .blue:
        return "blue-2"
    case .purple:
        return "purple-2"
    case .white:
        return "black"
    case .black:
        return "white"
    default:
        return "YellowOne"
    }
}

func getColorThree(color: Color)-> String {
    switch color {
    case .red:
        return "red-3"
    case .yellow:
        return "yellow-3"
    case .green:
        return "green-3"
    case .blue:
        return "blue-3"
    case .purple:
        return "purple-3"
    case .white:
        return "white-3"
    case .black:
        return "black-3"
    default:
        return "YellowTwo"
    }
}

func getColorFour(color: Color)-> String {
    switch color {
    case .red:
        return "red-2"
    case .yellow:
        return "yellow-2"
    case .green:
        return "green-2"
    case .blue:
        return "blue-2"
    case .purple:
        return "purple-2"
    case .white:
        return "white"
    case .black:
        return "black"
    default:
        return "GreyOne"
    }
}

func getColorTextContrast(color: Color)-> String {
    switch color {
    case .red:
        return "white"
    case .yellow:
        return "white"
    case .green:
        return "white"
    case .blue:
        return "white"
    case .purple:
        return "white"
    case .white:
        return "black"
    case .black:
        return "white"
    default:
        return "white"
    }
}

func getColorButtonLabelContrast(color: Color)-> String {
    switch color {
    case .white:
        return "white"
    case .black:
        return "black"
    default:
        return "GreyOne"
    }
}

func buttonAddColorContrast(color: Color)-> String {
    switch color {
    case .white:
        return "black"
    default:
        return "white"
    }
}

func buttonAddColorLabelSame(color: Color)-> String {
    switch color {
    case .white:
        return "white"
    default:
        return "black"
    }
}

func getColorExeptionChevronButton(color: Color)-> String {
    switch color {
    case .red:
        return "red-1"
    case .yellow:
        return "yellow-1"
    case .green:
        return "green-1"
    case .blue:
        return "blue-1"
    case .purple:
        return "purple-1"
    case .white:
        return "black"
    case .black:
        return "white"
    default:
        return "YellowOne"
    }
}

func getColorExeptChevronHalfModal(color: Color)-> String {
    switch color {
    case .red:
        return "red-2"
    case .yellow:
        return "yellow-2"
    case .green:
        return "green-2"
    case .blue:
        return "blue-2"
    case .purple:
        return "purple-2"
    case .white:
        return "black"
    case .black:
        return "white"
    default:
        return "YellowOne"
    }
}

func getColorPalateBackground(color: Color)-> String {
    switch color {
    case .red:
        return "red-1"
    case .yellow:
        return "yellow-1"
    case .green:
        return "green-1"
    case .blue:
        return "blue-1"
    case .purple:
        return "purple-1"
    case .white:
        return "white-2"
    case .black:
        return "black-2"
    default:
        return "GreyTwo"
    }
}

//MARK: - Underline Text field style
extension View {
    
    func underlineTextField(timerModel: TimerModel) -> some View {
        self
            .padding(.vertical, 5)
            .overlay(Rectangle().frame(height: 1).padding(.top, 35))
            .foregroundColor(Color("\(getColorTextContrast(color: timerModel.selectedColor))"))
            .padding(1)
    }
    
    //MARK: Placeholder coloring
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}




/*
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
*/

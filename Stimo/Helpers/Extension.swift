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

// MARK: -  Badge Proccesses Determination
func getBadgeName(point: Int) -> String {
    switch point {
    case 0..<10:
        return "badge-start"
    case 10..<50:
        return "badge-10"
    case 50..<100:
        return "badge-50"
    case 100..<200:
        return "badge-100"
    case 200..<300:
        return "badge-200"
    case 300..<500:
        return "badge-300"
    case 500..<750:
        return "badge-500"
    case 750..<1000:
        return "badge-750"
    case 1000..<1500:
        return "badge-1000"
    case 1500..<2000:
        return "badge-1500"
    case 2000..<5000:
        return "badge-2000"
    default:
        return "badge-5000"
    }
}

func getTheNextBadgeName(point: Int) -> String {
    switch point {
    case 0..<10:
        return "badge-10"
    case 10..<50:
        return "badge-50"
    case 50..<100:
        return "badge-100"
    case 100..<200:
        return "badge-200"
    case 200..<300:
        return "badge-300"
    case 300..<500:
        return "badge-500"
    case 500..<750:
        return "badge-750"
    case 750..<1000:
        return "badge-1000"
    case 1000..<1500:
        return "badge-1500"
    case 1500..<2000:
        return "badge-2000"
    case 2000..<5000:
        return "badge-5000"
    default:
        return "none"
    }
}

func getRangeBadge(point: Int) -> String {
    switch point {
    case 0..<10:
        return "0-9"
    case 10..<50:
        return "10-49"
    case 50..<100:
        return "50-99"
    case 100..<200:
        return "100-199"
    case 200..<300:
        return "200-199"
    case 300..<500:
        return "300-499"
    case 500..<750:
        return "500-749"
    case 750..<1000:
        return "750-999"
    case 1000..<1500:
        return "1000-1499"
    case 1500..<2000:
        return "1500-1999"
    case 2000..<5000:
        return "2000-4999"
    default:
        return "5000 Or More"
    }
}

func getDifferencePoint(point: Int) -> Int {
    switch point {
    case 0..<10:
        return 10-point
    case 10..<50:
        return 50-point
    case 50..<100:
        return 100-point
    case 100..<200:
        return 200-point
    case 200..<300:
        return 300-point
    case 300..<500:
        return 400-point
    case 500..<750:
        return 750-point
    case 750..<1000:
        return 1000-point
    case 1000..<1500:
        return 1500-point
    case 1500..<2000:
        return 2000-point
    case 2000..<5000:
        return 5000-point
    default:
        return 0
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

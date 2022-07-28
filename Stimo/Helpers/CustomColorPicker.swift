//
//  CustomColorPicker.swift
//  Stimo
//
//  Created by Ariel Waraney on 27/07/22.
//

import SwiftUI

struct CustomColorPicker: View {
    
    @EnvironmentObject var timerModel: TimerModel
    
    @Binding var selectedColors: Color
    private let colors: [Color] = [.red,.yellow,.green,.blue,.purple,.white,.gray,.black]
    
    var body: some View {
        HStack {
            ForEach(colors, id: \.self) { color in
                Circle()
                    .foregroundColor(color)
                    .frame(width: 30, height: 30)
                    .scaleEffect(color == selectedColors ? 0.8 : 1)
                    .overlay(
                        RoundedRectangle(cornerRadius: color == selectedColors ? 100:0)
                            .stroke(color == selectedColors ? color : .clear, lineWidth: 2)
                    )
                    .onTapGesture {
                        selectedColors = color
                        timerModel.selectedColor = selectedColors
                    }
            }
        }
    }
}

struct CustomColorPicker_Previews: PreviewProvider {
    static var previews: some View {
        CustomColorPicker(selectedColors: .constant(.gray))
    }
}

//
//  TimerControlView.swift
//  Stimo
//
//  Created by Ariel Waraney on 26/07/22.
//

import SwiftUI

struct TimerControlView: View {
    
    @EnvironmentObject var timerModel: TimerModel
    @Binding var showModalScreen: Bool
    @Environment(\.presentationMode) var presentMode
    @AppStorage("point") var userPoints = 0
    
    var body: some View {
        ZStack {
            Color("\(getColorOne(color: timerModel.selectedColor))").ignoresSafeArea()
            VStack(spacing: 20) {
                Button(){
                    //TODO: dismiss modal view
                    showModalScreen.toggle()
                } label: {
                    Image(systemName: "chevron.down")
                        .foregroundColor(Color("\(getColorExeptChevronHalfModal(color: timerModel.selectedColor))"))
                }
                .padding(.top, 20)
                Section {
                    HStack() {
                        Text("Your Points")
                        Spacer()
                        Text("\(userPoints)")
                            .fontWeight(.bold)
                    }
                    .foregroundColor(Color("\(buttonAddColorLabelSame(color: timerModel.selectedColor))"))
                    .padding(10)
                    .background(Color("\(buttonAddColorContrast(color: timerModel.selectedColor))"))
                    .cornerRadius(10)
                }
                .padding(.leading, 20)
                .padding(.trailing, 20)
                .padding(.top, 10)
                .padding(.bottom, 10)
                HStack(spacing: 30) {
                    
                    VStack {
                        Button(timerModel.isPaused ? "RESUME" : "PAUSE"){
                            //action
                            if timerModel.isPaused {
                                //continue the timer
                                timerModel.isStarted = true
                                timerModel.isPaused = false
                                timerModel.isFinished = false
                                timerModel.statusTitle = "Check Your Focus Plan Before Start!"
                            } else {
                                //pause the timer
                                pauseReductionPoint()
                                timerModel.isStarted = false
                                timerModel.isPaused = true
                                timerModel.isFinished = false
                                timerModel.statusTitle = "PAUSED"
                            }
                        }
                        .font(.system(size: 15, weight: .bold, design: .default))
                        .frame(width: 137, height: 39)
                        .foregroundColor(Color("\(getColorButtonLabelContrast(color: timerModel.selectedColor))"))
                        .background(Color("\(getColorThree(color: timerModel.selectedColor))"))
                        .cornerRadius(100)
                        .disabled(!pointIsEligible(request: "PauseRequest"))
                        .opacity(pointIsEligible(request: "PauseRequest") ? 1 : 0.5)
                        Text("(-2 Points)")
                            .font(.system(size: 14))
                            .foregroundColor(timerModel.isPaused ? Color("\(getColorOne(color: timerModel.selectedColor))") : Color("\(buttonAddColorContrast(color: timerModel.selectedColor))"))
                    }
                    
                    VStack {
                        Button("STOP"){
                            //action
                            //MARK: Reducing Points of 5 Over Here :
                            stopReductionPoint()
                            timerModel.stopTimer()
                            presentMode.wrappedValue.dismiss()
                            print("Timer start : \(timerModel.isStarted)")
                        }
                        .font(.system(size: 15, weight: .bold, design: .default))
                        .frame(width: 137, height: 39)
                        .foregroundColor(Color("\(getColorButtonLabelContrast(color: timerModel.selectedColor))"))
                        .background(Color("\(getColorTwo(color: timerModel.selectedColor))"))
                        .cornerRadius(100)
                        .disabled(!pointIsEligible(request: "StopRequest"))
                        .opacity(pointIsEligible(request: "StopRequest") ? 1 : 0.5)
                        Text("(-5 Points)")
                            .font(.system(size: 14))
                            .foregroundColor(Color("\(buttonAddColorContrast(color: timerModel.selectedColor))"))
                    }
                }
            }
            .cornerRadius(25)
        }
    }
    
    func stopReductionPoint() {
        var currentPoint = UserDefaults.standard.integer(forKey: "point")
        if currentPoint >= 5 {
            currentPoint -= 5
        } else {
            currentPoint = 0
        }
        //set to the current point
        UserDefaults.standard.set(currentPoint, forKey: "point")
    }
    
    func pauseReductionPoint() {
        var currentPoint = UserDefaults.standard.integer(forKey: "point")
        if currentPoint >= 2 {
            currentPoint -= 2
        } else {
            currentPoint = 0
        }
        //set to the current point
        UserDefaults.standard.set(currentPoint, forKey: "point")
    }
    
    func pointIsEligible(request: String) -> Bool {
        let currentPoint = UserDefaults.standard.integer(forKey: "point")
        if request == "PauseRequest" {
            if timerModel.isPaused == true {
                return true
            } else {
                if currentPoint >= 2 { return true }
                else { return false }
            }
        } else {
            //Stop Request
            if currentPoint >= 5 { return true }
            else { return false }
        }
    }
}

/*
struct TimerControlView_Previews: PreviewProvider {
    static var previews: some View {
        TimerControlView()
    }
}
*/

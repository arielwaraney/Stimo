//
//  TimerView.swift
//  Stimo
//
//  Created by Ariel Waraney on 22/07/22.
//

import SwiftUI

struct TimerView: View {
    
    @EnvironmentObject var timerModel: TimerModel
    @Environment(\.presentationMode) var presentMode
    
    var body: some View {
        ZStack {
            Color("GreyOne").ignoresSafeArea()
            VStack {
                HStack {
                    Spacer()
                    Button() {
                        //action
                        presentMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(Color("YellowOne"))
                    }
                }.padding()
                VStack(alignment: .center) {
                    Spacer()
                    Text("Check Your Focus Plan Before You Start!")
                        .foregroundColor(.white)
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    GeometryReader { proxy in
                        VStack(spacing: 15){
                            ZStack {
                                Circle()
                                    .stroke(Color("GreyOne"), lineWidth: 1)
                                Circle()
                                    .trim(from: 0, to: CGFloat(timerModel.progressBar))
                                    .stroke(Color("YellowOne"), lineWidth: 20)
                                Text("\(selectedTimeConvert(hint:"hr")):\(selectedTimeConvert(hint:"min")):\(selectedTimeConvert(hint:"sec"))")
                                    .font(.system(size: 45))
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color("YellowOne"))
                                    .rotationEffect(.init(degrees: 90))
                            }
                            .padding(30)
                            .frame(height: proxy.size.width)
                            .rotationEffect(.init(degrees: -90))
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    }
                    Spacer()
                    HStack {
                        Button("FOCUS PLAN"){
                            //action
                            print("Focus Planner")
                        }
                        .font(.system(size: 15, weight: .bold, design: .default))
                        .frame(width: 137, height: 39)
                        .foregroundColor(Color("GreyOne"))
                        .background(Color("YellowTwo"))
                        .cornerRadius(100)
                        
                        Button("START"){
                            //action
                            //timerModel.startTimer()
                            print("Timer start")
                        }
                        .font(.system(size: 15, weight: .bold, design: .default))
                        .frame(width: 137, height: 39)
                        .foregroundColor(Color("GreyOne"))
                        .background(Color("YellowOne"))
                        .cornerRadius(100)
                    }
                    Spacer()
                }
                .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
                    if timerModel.isStarted {
                        timerModel.updateTimer()
                    }
                }
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
    
    func selectedTimeConvert(hint: String) -> String {
        switch hint {
        case "hr":
            return "\(timerModel.hour >= 10 ? "\(timerModel.hour)" : "0\(timerModel.hour)")"
        case "min":
            return "\(timerModel.minute >= 10 ? "\(timerModel.minute)" : "0\(timerModel.minute)")"
        case "sec":
            return "\(timerModel.second >= 10 ? "\(timerModel.second)" : "0\(timerModel.second)")"
        default:
            return "error"
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView().environmentObject(TimerModel())
    }
}

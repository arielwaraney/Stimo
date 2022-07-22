//
//  TimerView.swift
//  Stimo
//
//  Created by Ariel Waraney on 22/07/22.
//

import SwiftUI

struct TimerView: View {
    
    @EnvironmentObject var timerModel: TimerModel
    
    var body: some View {
        ZStack {
            Color("GreyOne").ignoresSafeArea()
            VStack {
                HStack {
                    Spacer()
                    Button() {
                        //action
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
                                    .trim(from: 0, to: CGFloat(timerModel.progressBar-0.5))
                                    .stroke(Color("YellowOne"), lineWidth: 20)
                                Text(timerModel.timerStringValue)
                                    .font(.system(size: 45))
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color("YellowOne"))
                                    .rotationEffect(.init(degrees: -90))
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
                            
                        }
                        .buttonStyle(YellowTwo())
                        Button("START"){
                            //action
                            
                        }
                        .buttonStyle(YellowOne())
                    }
                    Spacer()
                }
            }
            .padding()
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView().environmentObject(TimerModel())
    }
}

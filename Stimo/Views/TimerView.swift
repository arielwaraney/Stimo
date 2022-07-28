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
    @State var isDone = false
    @State var mvFocusPlanShowed = false
    @State var mvTimerControlShowed = false
    
    var body: some View {
        
        if isDone {
            CompleteView().environmentObject(timerModel)
        } else {
            ZStack {
                Color("black-2").ignoresSafeArea()
                Color("\(getColorOne(color: timerModel.selectedColor))").opacity(mvTimerControlShowed ? 0.5 : 1).ignoresSafeArea()
                VStack {
                    HStack {
                        Spacer()
                        Button() {
                            //action
                            presentMode.wrappedValue.dismiss()
                        } label: {
                            Image(systemName: "x.circle.fill")
                                .foregroundColor(Color("\(getColorTwo(color: timerModel.selectedColor))"))
                        }
                        .opacity((timerModel.isStarted || timerModel.isPaused) ? 0 : 1)
                    }.padding()
                    VStack(alignment: .center) {
                        Spacer()
                        Text("\(timerModel.getStatusTitle())")
                            .foregroundColor(Color("\(getColorTextContrast(color: timerModel.selectedColor))"))
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                        GeometryReader { proxy in
                            VStack(spacing: 15){
                                ZStack {
                                    Circle()
                                        .stroke(Color("\(getColorFour(color: timerModel.selectedColor))"), lineWidth: 1)
                                    Circle()
                                        .trim(from: 0, to: CGFloat(timerModel.progressBar))
                                        .stroke(Color("\(getColorTwo(color: timerModel.selectedColor))"), lineWidth: 20)
                                    Text("\(selectedTimeConvert(hint:"hr")):\(selectedTimeConvert(hint:"min")):\(selectedTimeConvert(hint:"sec"))")
                                        .font(.system(size: 45))
                                        .fontWeight(.heavy)
                                        .foregroundColor(Color("\(getColorTextContrast(color: timerModel.selectedColor))"))
                                        .rotationEffect(.init(degrees: 90))
                                }
                                .padding(30)
                                .frame(height: proxy.size.width)
                                .rotationEffect(.init(degrees: -90))
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                        }
                        Spacer(minLength: 77)
                        ZStack {
                            HStack() {
                                Spacer()
                                Button() {
                                    //action
                                    mvFocusPlanShowed.toggle()
                                } label: {
                                    VStack {
                                        Image(systemName: "pencil.circle.fill")
                                            .foregroundColor(Color("\(getColorThree(color: timerModel.selectedColor))"))
                                        Text("Focus Plan")
                                            .foregroundColor(Color("\(getColorThree(color: timerModel.selectedColor))"))
                                    }
                                }
                                .opacity((timerModel.isStarted || timerModel.isPaused) ? 1 : 0)
                                .sheet(isPresented: $mvFocusPlanShowed) {
                                    FocusPlanView()
                                }
                                Spacer()
                                
                                Button() {
                                    //action
                                    mvTimerControlShowed.toggle()
                                    //Cancelling All Notifications
                                    //UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                                } label: {
                                    VStack {
                                        Image(systemName: "timer")
                                            .foregroundColor(Color("\(getColorTwo(color: timerModel.selectedColor))"))
                                        Text("Timer")
                                            .foregroundColor(Color("\(getColorTwo(color: timerModel.selectedColor))"))
                                    }
                                }
                                .opacity((timerModel.isStarted || timerModel.isPaused) ? 1 : 0)
                                Spacer()
                            }
                            
                            HStack(spacing: 30) {
                                Button("FOCUS PLAN"){
                                    //action
                                    mvFocusPlanShowed.toggle()
                                }
                                .sheet(isPresented: $mvFocusPlanShowed) {
                                    FocusPlanView()
                                }
                                .font(.system(size: 15, weight: .bold, design: .default))
                                .frame(width: 137, height: 39)
                                .foregroundColor(Color("\(getColorButtonLabelContrast(color: timerModel.selectedColor))"))
                                .background(Color("\(getColorThree(color: timerModel.selectedColor))"))
                                .cornerRadius(100)
                                .opacity((timerModel.isStarted || timerModel.isPaused) ? 0 : 1)
                                
                                Button("START"){
                                    //action
                                    timerModel.startTimer()
                                    print("Timer start : \(timerModel.isStarted)")
                                }
                                .font(.system(size: 15, weight: .bold, design: .default))
                                .frame(width: 137, height: 39)
                                .foregroundColor(Color("\(getColorButtonLabelContrast(color: timerModel.selectedColor))"))
                                .background(Color("\(getColorTwo(color: timerModel.selectedColor))"))
                                .cornerRadius(100)
                                .opacity((timerModel.isStarted || timerModel.isPaused) ? 0 : 1)
                            }
                        }
                        Spacer()
                    }
                    .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
                        if timerModel.isStarted {
                            timerModel.updateTimer()
                        }
                        if timerModel.isFinished {
                            setEarnPoint(time: timerModel.staticTotalSeconds)
                            //call the scheduler notification
                            NotificationManager.instance.scheduleNotification()
                            isDone = timerModel.isFinished
                            timerModel.stopTimer()
                            timerModel.isFinished.toggle()
                        }
                    }
                }.opacity(mvTimerControlShowed ? 0.5 : 1)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                TimerControlView(showModalScreen: $mvTimerControlShowed)
                    .padding(.top, (UIScreen.main.bounds.height/2 + UIScreen.main.bounds.height/7))
                    .offset(y: mvTimerControlShowed ? 0 : UIScreen.main.bounds.height)
                    .transition(.move(edge: .bottom))
                    .animation(.spring(), value: mvTimerControlShowed)
            }
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
    
    func setEarnPoint(time: Int){
        //MARK: 10 Minutes Completion = 1 Point
        //TODO: Change This To 600 (10 minutes)
        let earnedPoint:Int = time / 5
        print("points earned: \(earnedPoint)")
        //MARK: Set to user default earn
        UserDefaults.standard.set(earnedPoint, forKey: "earn")
        let pointBalance = UserDefaults.standard.integer(forKey: "point")
        let updatedBalance = pointBalance + earnedPoint
        //MARK: Set Updated Balance to user default point
        UserDefaults.standard.set(updatedBalance, forKey: "point")
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView().environmentObject(TimerModel())
    }
}

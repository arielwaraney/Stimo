//
//  ContentView.swift
//  Stimo
//
//  Created by Ariel Waraney on 20/07/22.
//

import SwiftUI

struct HomeView: View {
    
    @State var customAlertShowed = false
    @EnvironmentObject var timerModel: TimerModel
    @AppStorage("point") var userPoints = 0
    
    init() {
        UITableView.appearance().backgroundColor = .clear
        //MARK: Request Notifications
        NotificationManager.instance.requestAuthorization()
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("GreyOne").ignoresSafeArea()
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("Stimo")
                            .fontWeight(.heavy)
                            .font(.system(size: 30))
                            .foregroundColor(.white)
                        Text("Study Time Monitor")
                            .italic()
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                    }.padding(.leading)
                        .padding(.leading)
                        .padding(.top)
                    
                    ScrollView(.vertical) {
                        //Point
                        Section {
                            HStack() {
                                Text("Your Points")
                                    .foregroundColor(.white)
                                Spacer()
                                Text("\(userPoints)")
                                    .fontWeight(.bold)
                                    .foregroundColor(Color("YellowOne"))
                            }
                            .padding(10)
                            .background(Color("GreyTwo"))
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("YellowOne"), lineWidth: 3)
                            )
                            
                        }
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                        
                 
                        //Badge
                        Section {
                            HStack {
                                Text("Current Badge")
                                    .fontWeight(.bold)
                                    .font(.system(size: 25))
                                Spacer()
                                Button {
                                    //action
                                    withAnimation {
                                        customAlertShowed.toggle()
                                    }
                                } label: {
                                    Image("\(getBadgeName(point: userPoints))")
                                        .resizable()
                                        .frame(width:80, height: 50)
                                }
                            }
                            .padding(10)
                            .background(Color("GreyTwo"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                        
                        
                        //Focus Time
                        Section {
                            VStack() {
                                Spacer(minLength: 15)
                                VStack (alignment: .leading){
                                    Text("Focus Mode")
                                        .fontWeight(.bold)
                                        .font(.system(size: 25))
                                    Spacer()
                                    Text("Let’s focusing on studying or completing tasks while earning points to level up your badge status!")
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                                .foregroundColor(.white)
                                Image("study-image")
                                    .resizable()
                                    .frame(width: 143, height: 143)
                                Spacer(minLength: 20)
                                VStack {
                                    Text("Set Your Timer")
                                        .foregroundColor(.white)
                                    Spacer(minLength: 5)
                                    Text("(Tap And Hold)")
                                        .font(.system(size: 10))
                                        .foregroundColor(.white)
                                    Spacer(minLength: 20)
                                    HStack{
                                        Section {
                                            Text("\(timerModel.hour) hr")
                                                .font(.title3)
                                                .fontWeight(.semibold)
                                                .foregroundColor(Color("GreyTwo").opacity(timerModel.hour == 0 ? 0.8 : 1))
                                                .padding(.horizontal, 20)
                                                .padding(.vertical, 5)
                                                .background{
                                                    Capsule()
                                                        .fill(.white.opacity(timerModel.hour == 0 ? 0.5 : 1))
                                                }
                                                .contextMenu {
                                                    ContextMenuOption(maxValue: 12, hint: "hr") { value in
                                                        timerModel.hour = value
                                                    }
                                                }
                                        }
                                        Section {
                                            Text("\(timerModel.minute) min")
                                                .font(.title3)
                                                .fontWeight(.semibold)
                                                .foregroundColor(Color("GreyTwo").opacity(timerModel.minute == 0 ? 0.8 : 1))
                                                .padding(.horizontal, 20)
                                                .padding(.vertical, 5)
                                                .background{
                                                    Capsule()
                                                        .fill(.white.opacity(timerModel.minute == 0 ? 0.5 : 1))
                                                }
                                                .contextMenu {
                                                    ContextMenuOption(maxValue: 59, hint: "min") { value in
                                                        timerModel.minute = value
                                                    }
                                                }
                                        }
                                        Section {
                                            Text("\(timerModel.second) sec")
                                                .font(.title3)
                                                .fontWeight(.semibold)
                                                .foregroundColor(Color("GreyTwo").opacity(timerModel.second == 0 ? 0.8 : 1))
                                                .padding(.horizontal, 20)
                                                .padding(.vertical, 5)
                                                .background{
                                                    Capsule()
                                                        .fill(.white.opacity(timerModel.second == 0 ? 0.5 : 1))
                                                }
                                                .contextMenu {
                                                    ContextMenuOption(maxValue: 59, hint: "sec") { value in
                                                        timerModel.second = value
                                                    }
                                                }
                                        }
                                    }
                                    Spacer(minLength: 20)
                                }
                                Divider().background()
                                Spacer(minLength: 20)
                                NavigationLink(destination: TimerView().environmentObject(timerModel)){
                                    Text("LET'S GO")
                                        .fontWeight(.bold)
                                        .frame(width: 160, height: 39)
                                        .foregroundColor(Color("GreyOne"))
                                        .background(Color("YellowOne"))
                                        .cornerRadius(100)
                                }
                                .disabled(timerModel.second == 0 && timerModel.minute == 0 && timerModel.hour == 0)
                                .opacity((timerModel.second == 0 && timerModel.minute == 0 && timerModel.hour == 0) ? 0.5 : 1)
                                Spacer(minLength: 20)
                            }
                            .padding(10)
                            .background(Color("GreyTwo"))
                            .cornerRadius(10)
                        }
                        .padding(.leading, 20)
                        .padding(.trailing, 20)
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                    }
                    
                   
                    
                }
                .blur(radius: customAlertShowed ? 5 : 0)
                
                if customAlertShowed {
                    //open the custom pop up
                    BadgeView(shown: $customAlertShowed)
                }
            }
            .navigationBarHidden(true)
            .onAppear() {
                NotificationManager.instance.resetNotification()
            }
        }
    }
    
    //MARK: Reusable Context Menu Options
    @ViewBuilder
    func ContextMenuOption(maxValue: Int, hint: String, onClick: @escaping (Int)->())->some View {
        ForEach(0...maxValue, id: \.self) { value in
            Button("\(value) \(hint)"){
                onClick(value)
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(TimerModel())
    }
}


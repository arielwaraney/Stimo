//
//  ContentView.swift
//  Stimo
//
//  Created by Ariel Waraney on 20/07/22.
//

import SwiftUI

struct HomeView: View {
    
    @State var customAlertShowed = false
    
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack {
            Color(hex: 0x545454).ignoresSafeArea()
            VStack (alignment: .leading){
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
                Form {
                    //TODO: section border color to => #FFC107
                    Section {
                        HStack() {
                            Text("Points")
                                .foregroundColor(.white)
                            Spacer()
                            Text("10")
                                .fontWeight(.bold)
                                .foregroundColor(.yellow)
                        }
                    }
                    .listRowBackground(Color(hex: 0x484747))
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
                                Image("badge-start")
                                    .resizable()
                                    .frame(width:80, height: 50)
                            }
                        }
                        .foregroundColor(.white)
                    }
                    .listRowBackground(Color(hex: 0x484747))
                    Section {
                        VStack {
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
                                Spacer(minLength: 20)
                                HStack{
                                    //TODO: Button Tapped Effect & List Pop Up
                                    Button("0 hr") {
                                        //action
                                    }
                                    .buttonStyle(WhiteSmall())
                                    Button("10 min"){
                                        //action
                                    }
                                    .buttonStyle(WhiteSmall())
                                    Button("0 sec"){
                                        //action
                                    }
                                    .buttonStyle(WhiteSmall())
                                }
                                Spacer(minLength: 20)
                            }
                            Divider().background()
                            Spacer(minLength: 20)
                            Button("LET'S GO") {
                                //action
                            }
                            .buttonStyle(YellowMain())
                            Spacer(minLength: 20)
                        }
                    }
                    .listRowBackground(Color(hex: 0x484747))
                }
            }
            .blur(radius: customAlertShowed ? 5 : 0)
            
            if customAlertShowed {
                //open the custom pop up
                BadgeView(shown: $customAlertShowed)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

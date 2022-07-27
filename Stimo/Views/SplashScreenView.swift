//
//  SplashScreenView.swift
//  Stimo
//
//  Created by Ariel Waraney on 20/07/22.
//

import SwiftUI

struct SplashScreenView: View {
    
    @EnvironmentObject var timerModel: TimerModel
    
    @State private var isActive = false
    @State private var size = 0.5
    @State private var opacity = 0.5
    @State var isOpenend = false
    
    var body: some View {
        if isActive {
            HomeView()
        } else {
            ZStack {
                Color("GreyOne").ignoresSafeArea()
                VStack {
                    Spacer()
                    Text("Stimo")
                        .fontWeight(.heavy)
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                    Text("Study Time Monitor")
                        .italic()
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                    Spacer()
                    VStack{
                        Image("logo-app")
                            .resizable()
                            .scaledToFit()
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 2)){
                            self.size = 0.7
                            self.opacity = 1.0
                        }
                    }
                    Spacer()
                    Text("By : Ariel Waraney")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                    Spacer()
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.isActive = true
                }
            }
        }
        
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}

//
//  CompleteView.swift
//  Stimo
//
//  Created by Ariel Waraney on 25/07/22.
//

import SwiftUI

struct CompleteView: View {
    
    @Environment(\.presentationMode) var presentMode
    @State var earnPoints = UserDefaults.standard.integer(forKey: "earn")
    
    var body: some View {
        ZStack {
            Color("GreyOne").ignoresSafeArea()
            VStack {
                Spacer()
                Text("Congratulations")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                Text("You Did It!")
                    .foregroundColor(.white)
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                Spacer()
                Image("complete-image")
                    .resizable()
                    .scaledToFit()
                Spacer()
                HStack {
                    Text("You manage to get ")
                        .foregroundColor(.white)
                        .font(.system(size: 15))
                    Text("\(earnPoints) Points")
                        .foregroundColor(Color("YellowTwo"))
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                }
                Spacer()
                Button(){
                    presentMode.wrappedValue.dismiss()
                    NotificationManager.instance.resetNotification()
                } label: {
                    Text("DONE")
                        .fontWeight(.bold)
                        .frame(width: 160, height: 39)
                        .foregroundColor(Color("GreyOne"))
                        .background(Color("YellowOne"))
                        .cornerRadius(100)
                }
                Spacer()
            }
        }
    }
}

struct CompleteView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteView().environmentObject(TimerModel())
    }
}

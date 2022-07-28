//
//  BadgeView.swift
//  Stimo
//
//  Created by Ariel Waraney on 21/07/22.
//

import SwiftUI

struct BadgeView: View {
    
    @Binding var shown: Bool
    @AppStorage("point") var userPoints = 0
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
            
            VStack(spacing: 20) {
                HStack {
                    Spacer()
                    Button {
                        //action
                        withAnimation {
                            shown.toggle()
                        }
                    } label: {
                        Image(systemName: "x.circle.fill")
                    }
                }
                VStack {
                    Text("Current Badge!")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    Image("\(getBadgeName(point: userPoints))")
                        .resizable()
                        .frame(width: 296, height: 174)
                    Text("Have at least \(getRangeBadge(point: userPoints)) points")
                }
                Divider().background(.background)
                VStack {
                    Text("Next Badge!")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    Image("\(getTheNextBadgeName(point: userPoints))")
                        .resizable()
                        .frame(width: 136, height: 80)
                        .blur(radius: 10)
                    Text("\(getDifferencePoint(point: userPoints)) more point(s) to go!")
                }
            }
            .padding(.vertical, 25)
            .padding(.horizontal, 25)
            .background(Color("GreyTwo"))
            .cornerRadius(25)
            .foregroundColor(.white)
        .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black.opacity(0.7))
        .ignoresSafeArea(.all)
    }
}

/*
struct BadgeView_Previews: PreviewProvider {
    static var previews: some View {
        BadgeView()
    }
}
*/



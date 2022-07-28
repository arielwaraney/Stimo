//
//  StimoApp.swift
//  Stimo
//
//  Created by Ariel Waraney on 20/07/22.
//

import SwiftUI

@main
struct StimoApp: App {
    //MARK: Background Initiatizing Here
    @StateObject var timerModel: TimerModel = TimerModel()
    //MARK: Scene Phase
    @Environment(\.scenePhase) var phase
    //MARK: Storing Last Time Stamp
    @State var lastActiveTimeStamp: Date = Date()
    var body: some Scene {
        WindowGroup {
            SplashScreenView().environmentObject(timerModel)
        }
        .onChange(of: phase) { newValue in
            if timerModel.isStarted {
                if newValue == .background {
                    lastActiveTimeStamp = Date()
                    //print("Background with date : \(lastActiveTimeStamp)")
                }
                if newValue == .active {
                    //print("Active again with date : \(lastActiveTimeStamp)")
                    //MARK: Finding the difference
                    let currentTimeStampDiff = Date().timeIntervalSince(lastActiveTimeStamp)
                    if timerModel.totalSeconds - Int(currentTimeStampDiff) <= 0 {
                        timerModel.isStarted = false
                        timerModel.totalSeconds = 0
                        timerModel.isFinished = true
                    } else {
                        timerModel.totalSeconds -= Int(currentTimeStampDiff)
                    }
                }
            }
            
        }
    }
}

//
//  TimerModel.swift
//  Stimo
//
//  Created by Ariel Waraney on 22/07/22.
//

import SwiftUI

class TimerModel: NSObject, ObservableObject {
    //MARK: Timer Properties
    @Published var progressBar: Float = 1
    @Published var timerStringValue: String = "00:00:00"
    
    @Published var hour: Int = 0
    @Published var minute: Int = 0
    @Published var second: Int = 5
    
    
    @Published var isStarted: Bool = false
    @Published var isPaused: Bool = false
    @Published var isFinished: Bool = false
    
    @Published var totalSeconds: Int = 0
    @Published var staticTotalSeconds: Int = 0
    
    override init() {
        super.init()
    }
    
    //MARK: Starting Timer
    func startTimer() {
        withAnimation(.easeInOut(duration: 0.25)){
            isStarted = true
        }
        timerStringValue = "\(hour == 0 ? "" : "\(hour):")\(minute >= 10 ? "\(minute):" : "0\(minute):")\(second >= 10 ? "\(second)" : "0\(second)")"
        //MARK: Calculating Total Seconds For Timer Animation
        totalSeconds = (hour * 3600) + (minute * 60) + second
        staticTotalSeconds = totalSeconds
    }
    
    //MARK: Stopping Timer
    func stopTimer() {
        withAnimation {
            isStarted = false
            hour = 0
            minute = 0
            second = 0
            progressBar = 1
            totalSeconds = 0
            staticTotalSeconds = 0
        }
    }
    
    //MARK: Updating Timer
    func updateTimer() {
        totalSeconds -= 1
        progressBar = Float(CGFloat(totalSeconds) / CGFloat(staticTotalSeconds))
        progressBar = (progressBar < 0 ? 0 : progressBar)
        hour = totalSeconds/3600
        minute = (totalSeconds/60) % 60
        second = (totalSeconds%60)
        timerStringValue = "\(hour == 0 ? "" : "\(hour):")\(minute >= 10 ? "\(minute):" : "0\(minute):")\(second >= 10 ? "\(second)" : "0\(second)")"
        if(hour == 0 && minute == 0 && second == 0){
            isStarted = false
            isFinished = true
            print("Finished")
        }
    }
}

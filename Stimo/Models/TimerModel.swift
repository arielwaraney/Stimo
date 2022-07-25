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
    @Published var minute: Int = 30
    @Published var second: Int = 0
    
    override init() {
        //
    }
}

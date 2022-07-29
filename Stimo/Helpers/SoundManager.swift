//
//  SoundManager.swift
//  Stimo
//
//  Created by Ariel Waraney on 29/07/22.
//

import Foundation
import SwiftUI
import AVKit

class SoundManager {
    
    static let instance = SoundManager()
    var player: AVAudioPlayer?
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "sound-complete", withExtension: ".mp3") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error Play Sound : \(error)")
        }
    }
}

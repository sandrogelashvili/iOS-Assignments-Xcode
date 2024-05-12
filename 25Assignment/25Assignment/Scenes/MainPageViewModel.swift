//
//  MainPageViewModel.swift
//  25Assignment
//
//  Created by Sandro Gelashvili on 10.05.24.
//

import Foundation

final class MainPageViewModel {
//
//   var isPlaying = false
//   private var currentProgress: Float = 0.0
//   private let durationInSeconds: Float = 218
//   private var progressIncrement: Float = 0.0
//   private var progressTimer: Timer?
//    
//    
//    
//    func togglePlayPause() {
//        print("Toggle play/pause called")
//           if isPlaying {
//               isPlaying = false // Set to false if currently playing
//           } else {
//               isPlaying = true // Set to true if currently paused
//           }
//           print("Is playing: \(isPlaying)")
//        
//        isPlaying.toggle()
//        if isPlaying {
//            startProgressBar()
//        } else {
//            stopProgressBar()
//        }
//    }
//    
//    func startProgressBar() {
//        progressIncrement = 1.0 / durationInSeconds
//        progressTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] timer in
//            guard let self = self else { return }
//            self.currentProgress += self.progressIncrement
//            if self.currentProgress >= 1.0 {
//                timer.invalidate()
//            }
//            self.updateTimeLabels()
//        }
//    }
//    
//    func updateTimeLabels() {
//        let currentTimes = Int(currentProgress * durationInSeconds)
//        let totalTimes = Int(durationInSeconds)
//        // Notify View about time updates
//    }
//    
//    func formattedTime(seconds: Int) -> String {
//        let minutes = seconds / 60
//        let seconds = seconds % 60
//        return String(format: "%02d:%02d", minutes, seconds)
//    }
//    
//    func stopProgressBar() {
//        progressTimer?.invalidate()
//    }
}

//
//  ReadyViewModel.swift
//  Muscle
//
//  Created by 稗田一亜 on 2022/09/26.
//

import SwiftUI
import AVFoundation

class ReadyViewModel: ObservableObject {
    
    static let shared: ReadyViewModel = .init()
    
    var countDown = 0
    var timer: Timer?
    var startTime = false
    @Published var navigated = false
    // 音声
    private var speechSynthesizer : AVSpeechSynthesizer!
    
    func startTimer() {
        self.countDown = 5
        self.speeche(text: String(self.countDown))
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            
            self.countDown -= 1
            self.speeche(text: String(self.countDown))
            print("\(self.countDown)")
            if self.countDown <= 0 {
                self.timer?.invalidate()
                self.navigated = true
            }
        }
    }
    
    // 自動音声機能
    func speeche(text: String) {
        
        // AVSpeechSynthesizerのインスタンス作成
        speechSynthesizer = AVSpeechSynthesizer()
        // 読み上げる、文字、言語などの設定
        let utterance = AVSpeechUtterance(string: text) // 読み上げる文字
        utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP") // 言語
        utterance.rate = 0.5 // 読み上げ速度
        utterance.pitchMultiplier = 1.0 // 読み上げる声のピッチ
        utterance.preUtteranceDelay = 0.0
        speechSynthesizer.speak(utterance)
    }
}

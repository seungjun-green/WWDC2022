//
//  Speech.swift
//  WWDC2022
//
//  Created by SeungJun Lee on 4/20/22.
//

import Foundation
import Speech

class Speech {
    
    static func speak(sentence: String) {
        let utterance = AVSpeechUtterance(string: sentence)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }

    static func requestPermission() {
            SFSpeechRecognizer.requestAuthorization { authStatus in
                if authStatus == .authorized {
                    print("Thanks")
                } else {
                    print("Speech Failed")
                }
            }
        }
    
   
}

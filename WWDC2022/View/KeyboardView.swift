//
//  KeyboardView.swift
//  WWDC2022
//
//  Created by SeungJun Lee on 4/18/22.
//

import Speech
import CoreML
import SwiftUI

struct KeyboardView: View {
    @Binding var isActive: Bool
    @Binding var shownText: String
    @Binding var robotSay: String
    @Binding var humanSay: String
    @Binding var emotion: String
    @FocusState var userTyping: Bool
    var body: some View {
        HStack{
            
            TextField("HUMAN:", text: $humanSay)
                .onChange(of: humanSay) { _ in
                    // analyze emoiton, then change face expression of bot
                    getEmotion(input: humanSay)
                }
                .textFieldStyle(.roundedBorder)
                
            
            Spacer()
            
            Button {
                generateRespond(input: humanSay)
                
                shownText = ""
                isActive = true
                
            } label: {
                Image(systemName: "arrow.up.circle").font(Font.largeTitle)
            }
        }
        .padding()
    }
    
    func getEmotion(input: String) {
        do {
            let config = MLModelConfiguration()
            let model = try EmotionClassifierPro(configuration: config)
            let prediction = try model.prediction(text: input)
           emotion = prediction.label
        } catch {
            print("Some error happend")
        }
    }
    
    func generateRespond(input: String){
        do {
            let config = MLModelConfiguration()
            let model = try TagClassifier1(configuration: config)
            let prediction = try model.prediction(text: humanSay)
            robotSay =  get_response(label: prediction.label)
            //speak(sentence: robotSay)
        } catch {
            print("Some error happend")
            speak(sentence: "Unexpected error happend, Could you try again?")
        }
    }
    
    func speak(sentence: String) {
        let utterance = AVSpeechUtterance(string: sentence)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
    
    func get_response(label: String) -> String {
        let data = DataR()
        return data.output[label]?["responses"]?.randomElement() ?? "OK"
    }
}


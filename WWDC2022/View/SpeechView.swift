//
//  SpeechView.swift
//  WWDC2022
//
//  Created by SeungJun Lee on 4/18/22.
//
import CoreML
import Speech
import SwiftUI

struct SpeechView: View {
    @Binding var userIsSpeaking: Bool
    @Binding var humanSay: String
    @Binding var isActive: Bool
    @Binding var shownText: String
    @Binding var robotSay: String
    @Binding var emotion: String
    
    var body: some View {
        Button(action: {
            
            
            if userIsSpeaking {
                // stop recording
                
                // trabscribe the recorded audio file
                
                //generate respond
                getEmotion(input: humanSay)
                generateRespond(input: humanSay)
                
                shownText = ""
                isActive = true
            } else {
                // start recording
            }
            
            userIsSpeaking.toggle()
            
        }, label: {
            
            if userIsSpeaking {
                MicAnimationView().frame(height: 110)
            } else {
                
                VStack{
                Image(systemName: "mic.circle")
                    .resizable()
                    .foregroundColor(.blue)
                    .frame(width: 70, height: 70)
                }.frame(height: 110)
            }
            
        })
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

struct MicAnimationView: View {
    
    var barHeight: CGFloat {
        CGFloat(Int.random(in: 25..<100))
    }
    
    var body: some View {
        TimelineView(.periodic(from: Date(), by: 0.085)){ context in
        HStack{
            ForEach(0..<20) { _ in
                Rectangle().fill(Color.blue).frame(width: 3, height: barHeight)
            }
        }
    }
    }
}

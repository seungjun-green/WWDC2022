//
//  ContentView.swift
//  WWDC2022
//
//  Created by SeungJun Lee on 4/18/22.
//

import CoreML
import Speech
import SwiftUI
import AVFoundation

struct ContentView: View {
    
    @State private var humanSay = ""
    @State private var robotSay = ""
    @State private var shownText = ""
    @State private var robotTyping = true
    @State private var speechMode = true
    @State private var userIsSpeaking = false
    @State private var emotion = ""
    @State private var transcribeFinished = false
    @State private var isRecording = false
    @State private var curr = 0
    @FocusState var userTyping: Bool
    
    var body: some View {
        
        NavigationView{
            VStack{
                RobotFacesView(emotion: emotion).padding(.top)
                Spacer()
                RobotTypingView(robotTyping: $robotTyping, shownText: $shownText, robotSay: $robotSay, transcribeDone: $transcribeFinished, curr: $curr)
                Spacer()
                
                if speechMode {
                    SpeechView(userIsSpeaking: $userIsSpeaking, humanSay: $humanSay, robotTyping: $robotTyping, shownText: $shownText, robotSay: $robotSay, emotion: $emotion, transcribeDone: $transcribeFinished, recording: $isRecording).padding(.bottom)
                } else {
                    KeyboardView(robotTyping: $robotTyping, shownText: $shownText, robotSay: $robotSay, humanSay: $humanSay, emotion: $emotion, curr: $curr).focused($userTyping).ignoresSafeArea(.keyboard)
                }
            }.navigationTitle("Humanoid")
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        
                        Button("Clear All") {
                            humanSay = ""
                        }
                        
                        Spacer()
                        
                        Button("Done") {
                            userTyping = false
                        }
                    }
                    
                    
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button {
                            if !isRecording && robotTyping == false {
                                speechMode.toggle()
                            }
                        } label: {
                            if speechMode {
                                Image(systemName: "mic")
                            } else {
                                Image(systemName: "keyboard")
                            }
                        }
                        
                    }
                }
            
        }.preferredColorScheme(.dark)
        
        
        
    }
    
}


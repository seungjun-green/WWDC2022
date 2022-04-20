//
//  ContentView.swift
//  WWDC2022
//
//  Created by SeungJun Lee on 4/18/22.
//

import SwiftUI

import AVKit
import CoreML
import NaturalLanguage
import Speech
import SwiftUI
import AVFoundation


struct ContentView: View {
    
    @State private var humanSay = "Hi"
    @State private var robotSay = ""
    @State private var shownText = ""
    @State private var robotTyping = true
    @State private var speechMode = true
    @State private var userIsSpeaking = false
    @State private var emotion = ""
    @State private var transcribeFinished = false
    @State private var isRecording = false
    @FocusState var userTyping: Bool
    
    var body: some View {
        GeometryReader { geo in
            NavigationView{
                
                VStack{
                    if speechMode {
                        
                        VStack{
                            RobotFacesView(emotion: emotion).padding(.top)
                            Spacer()
                            RobotTypingView(robotTyping: $robotTyping, shownText: $shownText, robotSay: $robotSay, transcribeDone: $transcribeFinished)
                            SpeechView(userIsSpeaking: $userIsSpeaking, humanSay: $humanSay, robotTyping: $robotTyping, shownText: $shownText, robotSay: $robotSay, emotion: $emotion, transcribeDone: $transcribeFinished, recording: $isRecording).padding(.bottom)
                            Spacer()
                            
                        }
                    } else {
                        ZStack{
                            VStack{
                                RobotFacesView(emotion: emotion).padding(.top)
                                Spacer()
                                RobotTypingView(robotTyping: $robotTyping, shownText: $shownText, robotSay: $robotSay, transcribeDone: $transcribeFinished)
                                Spacer().frame(height: geo.size.height * 0.4)
                            }
                            
                            VStack{
                                Spacer().frame(height: geo.size.height * 0.6)
                                
                                KeyboardView(robotTyping: $robotTyping, shownText: $shownText, robotSay: $robotSay, humanSay: $humanSay, emotion: $emotion).focused($userTyping).ignoresSafeArea(.keyboard)
                            }
                        }
                    }
                    
                    
                }
                .navigationTitle("Humanoid")
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
                            if !isRecording {
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
    
}

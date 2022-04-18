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

struct ContentView: View {
    
    @State private var humanSay = ""
    @State private var robotSay = ""
    @State private var shownText = ""
    @State private var isActive = true
    @State private var speechMode = true
    @State private var userIsSpeaking = false
    @State private var emotion = ""
    @FocusState var userTyping: Bool
    
    var body: some View {
        GeometryReader { geo in
            NavigationView{
                VStack{
                    RobotFacesView(emotion: emotion).padding(.top)
                    
                    Spacer()
                    
                    RobotSayView(isActive: $isActive, shownText: $shownText, robotSay: $robotSay)
                                        
                    VStack{
                        if speechMode {
                            SpeechView(userIsSpeaking: $userIsSpeaking, humanSay: $humanSay, isActive: $isActive, shownText: $shownText, robotSay: $robotSay, emotion: $emotion)
                        } else {
                            KeyboardView(isActive: $isActive, shownText: $shownText, robotSay: $robotSay, humanSay: $humanSay, emotion: $emotion).focused($userTyping)
                        }
                    }
                    
                    Spacer()
                    
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
                                speechMode.toggle()
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

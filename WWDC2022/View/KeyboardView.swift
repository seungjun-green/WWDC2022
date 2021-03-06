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
    @Binding var robotTyping: Bool
    @Binding var shownText: String
    @Binding var robotSay: String
    @Binding var humanSay: String
    @Binding var emotion: String
    @Binding var curr: Int
    @FocusState var userTyping: Bool
    
    var body: some View {
        HStack{
            TextField("HUMAN:", text: $humanSay)
                .onChange(of: humanSay) { _ in
                    // analyze emoiton, then change face expression of bot
                    emotion = Brain.getEmotion(input: humanSay)
                }
                .textFieldStyle(.roundedBorder)
            
            Spacer()
            
            Button {
                curr = 0
                robotSay = Brain.generateRespond(input: humanSay)
                
                shownText = ""
                robotTyping = true
                
            } label: {
                Image(systemName: "arrow.up.circle").font(Font.largeTitle)
            }
        }
        .padding()
    }
}


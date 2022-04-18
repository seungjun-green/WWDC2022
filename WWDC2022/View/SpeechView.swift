//
//  SpeechView.swift
//  WWDC2022
//
//  Created by SeungJun Lee on 4/18/22.
//

import SwiftUI

struct SpeechView: View {
    @Binding var userIsSpeaking: Bool
    var body: some View {
        Button(action: {
            userIsSpeaking.toggle()
            
            
            if userIsSpeaking {
                // finish recording
                // trabscribe the recorded audio file
            } else {
                // start recording
            }
            
        }, label: {
            
            if userIsSpeaking {
                MicAnimationView()
            } else {
                Circle().fill(Color.red)
                    .frame(width: 70, height: 70)
                
            }
            
        })
    }
}

struct MicAnimationView: View {
    
    var barHeight: CGFloat {
        CGFloat(Int.random(in: 50..<100))
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

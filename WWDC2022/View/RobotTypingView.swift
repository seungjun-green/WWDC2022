//
//  RobotSayView.swift
//  WWDC2022
//
//  Created by SeungJun Lee on 4/18/22.
//

import SwiftUI

struct RobotTypingView: View {
    
    @State private var timer = Timer.publish(every: 0.08, on: .current, in: .common).autoconnect()
    @State private var timer2 = Timer.publish(every: 0.5, on: .current, in: .common).autoconnect()
   
    @State private var showCursor = false
    @Binding var robotTyping: Bool
    @Binding var shownText: String
    @Binding var robotSay: String
    @Binding var transcribeDone: Bool
    @Binding var curr: Int
    
    var cursorView: Text {
        if shownText.isEmpty || showCursor == false {
            return Text("").font(Font.title)
        } else {
            return Text("|").foregroundColor(Color.green).font(Font.title)
        }
    }
    
    var body: some View {
        VStack{
            HStack{
                    HStack{
                        Text(shownText) + cursorView
                    }
                
                Spacer()
            }.foregroundColor(Color.green)
                .onReceive(timer) { _ in
                    if robotTyping && transcribeDone {
                        if curr < robotSay.count  {
                            if curr == 0 {
                                Speech.speak(sentence: robotSay)
                            }
                            shownText+=String(Array(robotSay)[curr])
                            curr+=1
                            showCursor.toggle()
                        } else {
                            robotTyping = false
                            curr=0
                        }
                    }
                    
                    if !transcribeDone {
                        curr = 0
                    }
                }.onReceive(timer2) { _ in
                    showCursor.toggle()
                }.font(Font.title)
            
        }.frame(height: 110)
            .padding(.horizontal)
    }
}


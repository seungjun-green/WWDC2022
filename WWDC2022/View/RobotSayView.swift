//
//  RobotSayView.swift
//  WWDC2022
//
//  Created by SeungJun Lee on 4/18/22.
//

import SwiftUI

struct RobotSayView: View {
    
    @State private var timer = Timer.publish(every: 0.1, on: .current, in: .common).autoconnect()
    @State private var timer2 = Timer.publish(every: 0.5, on: .current, in: .common).autoconnect()
    @State private var curr = 0
    @State private var showCursor = false
    @Binding var isActive: Bool
    @Binding var shownText: String
    @Binding var robotSay: String
    
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
                Text(shownText) + cursorView
                Spacer()
            }.foregroundColor(Color.green)
                .onReceive(timer) { _ in
                    if isActive {
                        if curr < robotSay.count  {
                            shownText+=String(Array(robotSay)[curr])
                            curr+=1
                            showCursor.toggle()
                        } else {
                            isActive = false
                            curr=0
                        }
                    }
                    
                }.onReceive(timer2) { _ in
                    showCursor.toggle()
                }.font(Font.title)
            
        }.frame(height: 110)
            .padding(.horizontal)
    }
}

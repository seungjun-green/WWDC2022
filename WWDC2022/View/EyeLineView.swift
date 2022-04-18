//
//  EyeLineView.swift
//  WWDC2022
//
//  Created by SeungJun Lee on 4/18/22.
//

import SwiftUI


struct EyeLineView: View {
    var body: some View {
        HStack{
            Spacer()
            Spacer()
            Spacer()
            EyeView()
            
            Spacer()
            Spacer()
            
            EyeView()
            
            
            Spacer()
            Spacer()
            Spacer()
        }.frame(height: 62)
    }
}

struct EyeView: View {
    var body: some View {
        Circle().stroke(style: StrokeStyle(lineWidth: 2, lineCap: .square,  dash: [4], dashPhase:2))
            .frame(width: 50, height: 50)
            .foregroundColor(Color.blue)
            .glow(color: .blue, radius: 12)
    }
}



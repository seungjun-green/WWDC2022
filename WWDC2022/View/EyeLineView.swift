//
//  EyeLineView.swift
//  WWDC2022
//
//  Created by SeungJun Lee on 4/18/22.
//

import SwiftUI


struct EyeLineView: View {
    var geo: GeometryProxy
    var body: some View {
        HStack{
            Spacer()
            
            Eye2().frame(width: geo.size.height * 0.1, height: geo.size.height * 0.1)
            
            Spacer()
            
            Eye2().frame(width: geo.size.height * 0.1, height: geo.size.height * 0.1)
            
            Spacer()
        }.frame(width: geo.size.height * 0.93)
    }
}



struct NormallEye: View {
    var body: some View {
        Circle().stroke(style: StrokeStyle(lineWidth: 2, lineCap: .square,  dash: [4], dashPhase:2))
            .foregroundColor(Color.blue)
            .glow(color: .blue, radius: 12)
    }
}


// eye for Fear and surprise
struct Eye2: View {
    var body: some View {
        Circle().stroke(style: StrokeStyle(lineWidth: 2, lineCap: .square,  dash: [4], dashPhase:2))
            .foregroundColor(Color.green)
            .glow(color: .blue, radius: 12)
    }
}



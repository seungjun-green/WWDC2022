//
//  EyeLineView.swift
//  WWDC2022
//
//  Created by SeungJun Lee on 4/18/22.
//

import SwiftUI


struct EyeLineView: View {
    var geo: GeometryProxy
    var emotion: String
    var body: some View {
        HStack{
            Spacer()
            
            Eye(emotion: emotion).frame(width: geo.size.height * 0.1, height: geo.size.height * 0.1)
            
            Spacer()
            
            Eye(emotion: emotion).frame(width: geo.size.height * 0.1, height: geo.size.height * 0.1)
            
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
struct Eye: View {
    var emotion: String
    
    var emotionColor: Color {
        if emotion == "love" {
            return Color.pink
        } else {
            return Color.white
        }
    }
    var body: some View {
        Circle().stroke(style: StrokeStyle(lineWidth: 2, lineCap: .square,  dash: [4], dashPhase:2))
            .foregroundColor(Color.white)
            .glow(color: emotionColor, radius: 12)
    }
}



struct LoveEye: View {
    var geo: GeometryProxy
    var body: some View {
        Circle().stroke(style: StrokeStyle(lineWidth: 2, lineCap: .square,  dash: [4], dashPhase:2))
            .frame(width: geo.size.height * 0.4, height: geo.size.height * 0.4)
            .foregroundColor(Color.white)
            .glow(color: .white, radius: 12)
    }
    
}


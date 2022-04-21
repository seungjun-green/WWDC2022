//
//  FaceLineView.swift
//  WWDC2022
//
//  Created by SeungJun Lee on 4/18/22.
//

import SwiftUI

struct FaceLineView: View {
    var emotion: String
    
    var emotionColor : Color {
        if emotion == "anger" {
            return Color.red
        } else {
            return Color.yellow
        }
    }
    var body: some View {
        Circle().stroke(style: StrokeStyle(lineWidth: 3, lineCap: .square,  dash: [12], dashPhase:2))
            .foregroundColor(emotionColor)
            .glow(color: emotionColor, radius: 12)
    }
}

extension View {
    func glow(color: Color, radius: CGFloat) -> some View {
        self
            .overlay(self.blur(radius: 4))
            .shadow(color: color, radius: 12)
            .shadow(color: color, radius: 12)
    }
}

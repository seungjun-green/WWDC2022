//
//  MothView.swift
//  WWDC2022
//
//  Created by SeungJun Lee on 4/18/22.
//

import SwiftUI


struct MouthView: View {
    var body: some View {
       Mouth().stroke(style: StrokeStyle(lineWidth: 2, lineCap: .square,  dash: [4], dashPhase: 2))
            .frame(width: 80, height: 50)
            .foregroundColor(Color.blue)
            .glow(color: .blue, radius: 12)
    }
}

struct Mouth: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x:0, y:rect.size.height/4))
            path.addQuadCurve(to: CGPoint(x:rect.size.width, y:rect.size.height/4), control: CGPoint(x:rect.size.width/2, y:rect.size.height*2.5/4))
        }
    }
}

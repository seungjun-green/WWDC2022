//
//  MothView.swift
//  WWDC2022
//
//  Created by SeungJun Lee on 4/18/22.
//

import SwiftUI


struct MouthView: View {
    var body: some View {
       HappyMouth().stroke(style: StrokeStyle(lineWidth: 2, lineCap: .square,  dash: [4], dashPhase: 2))
            .frame(width: 120, height: 50)
            .foregroundColor(Color.blue)
            .glow(color: .blue, radius: 12)
    }
}

struct HappyMouth: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x:0, y:rect.size.height))
            path.addQuadCurve(to: CGPoint(x:rect.size.width, y:rect.size.height), control: CGPoint(x:rect.size.width/2, y:rect.size.height*1.8))
        }
    }
}

struct SaidMouth: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x:0, y:rect.size.height))
            path.addQuadCurve(to: CGPoint(x:rect.size.width, y:rect.size.height), control: CGPoint(x:rect.size.width/2, y: -rect.size.height*0.5))
        }
    }
}

struct AngryMouth: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x:0, y:rect.size.height))
            path.addLine(to: CGPoint(x: rect.size.width, y: rect.size.height - 20))
        }
    }
}

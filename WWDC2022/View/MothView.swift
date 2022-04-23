//
//  MothView.swift
//  WWDC2022
//
//  Created by SeungJun Lee on 4/18/22.
//

import SwiftUI

struct HappyMouth: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x:0, y:rect.size.height))
            path.addQuadCurve(to: CGPoint(x:rect.size.width, y:rect.size.height), control: CGPoint(x:rect.size.width/2, y:rect.size.height*1.6))
            path.move(to: CGPoint(x:0, y:rect.size.height))
            path.addQuadCurve(to: CGPoint(x:rect.size.width, y:rect.size.height), control: CGPoint(x:rect.size.width/2, y:rect.size.height*2.8))
        }
    }
}

struct LoveMouth: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x:0, y:rect.size.height))
            path.addQuadCurve(to: CGPoint(x:rect.size.width, y:rect.size.height), control: CGPoint(x:rect.size.width/2, y:rect.size.height*1.8))
        }
    }
}

struct NeturalMouth: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x:0, y:rect.size.height))
            path.addQuadCurve(to: CGPoint(x:rect.size.width, y:rect.size.height), control: CGPoint(x:rect.size.width/2, y:rect.size.height*1.8))
        }
    }
}

struct SadMouth: Shape {
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

struct SurprisedMouth: View {
    var geo: GeometryProxy
    var body: some View {
        Circle().stroke(style: StrokeStyle(lineWidth: 2, lineCap: .square,  dash: [4], dashPhase:2))
            .frame(width: geo.size.height * 0.4, height: geo.size.height * 0.4)
            .foregroundColor(Color.white)
            .glowEffect(color: .white, radius: 12)
    }
    
}


struct FearMouth: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x:0, y:rect.size.height-10))
            path.addLine(to: CGPoint(x: rect.size.width, y:rect.size.height-10))
            path.addLine(to: CGPoint(x: rect.size.width, y:rect.size.height+30))
            path.addLine(to: CGPoint(x:0, y:rect.size.height+30))
            path.addLine(to: CGPoint(x:0, y:rect.size.height-10))
            path.move(to: CGPoint(x:0, y:rect.size.height+10))
            path.addLine(to: CGPoint(x: rect.size.width, y:rect.size.height+10))
            path.move(to: CGPoint(x: rect.size.width/5, y: rect.size.height+30))
            path.addLine(to: CGPoint(x: rect.size.width/5, y:rect.size.height-10))
            path.move(to: CGPoint(x: rect.size.width*2/5, y: rect.size.height+30))
            path.addLine(to: CGPoint(x: rect.size.width*2/5, y:rect.size.height-10))
            path.move(to: CGPoint(x: rect.size.width*3/5, y: rect.size.height+30))
            path.addLine(to: CGPoint(x: rect.size.width*3/5, y:rect.size.height-10))
            path.move(to: CGPoint(x: rect.size.width*4/5, y: rect.size.height+30))
            path.addLine(to: CGPoint(x: rect.size.width*4/5, y:rect.size.height-10))
        }
    }
}

extension Shape {
    func mouthStyling(color: Color) -> some View {
        self
            .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .square,  dash: [4], dashPhase: 2))
            .foregroundColor(color)
            .glowEffect(color: color, radius: 12)
    }
}



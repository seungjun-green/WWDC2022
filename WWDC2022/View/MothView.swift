//
//  MothView.swift
//  WWDC2022
//
//  Created by SeungJun Lee on 4/18/22.
//

import SwiftUI

// DONE
struct HappyMouth: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x:0, y:rect.size.height))
            path.addQuadCurve(to: CGPoint(x:rect.size.width, y:rect.size.height), control: CGPoint(x:rect.size.width/2, y:rect.size.height*1.8))
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
            path.addQuadCurve(to: CGPoint(x:rect.size.width, y:rect.size.height), control: CGPoint(x:rect.size.width/2, y: -rect.size.height*0.5))
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
    var body: some View {
        Circle().stroke(style: StrokeStyle(lineWidth: 2, lineCap: .square,  dash: [4], dashPhase:2))
            .frame(width: 80, height: 80)
            .foregroundColor(Color.blue)
            .glow(color: .blue, radius: 12)
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
    func mouthStyling() -> some View {
        self
            .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .square,  dash: [4], dashPhase: 2))
            .frame(width: 120, height: 50)
            .foregroundColor(Color.blue)
            .glow(color: .blue, radius: 12)
    }
}



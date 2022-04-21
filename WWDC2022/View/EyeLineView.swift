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
        
        VStack{
            if emotion != "love" {
            Circle().stroke(style: StrokeStyle(lineWidth: 2, lineCap: .square,  dash: [4], dashPhase:2))
                .foregroundColor(Color.white)
                .glow(color: emotionColor, radius: 12)
            } else {
                HeartEye().loveEyeStyling()
            }
        }
    }
}



struct HeartEye: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x:0, y:rect.size.height*0.4))
            path.addQuadCurve(to: CGPoint(x:rect.size.width/2, y:rect.size.height*0.4), control: CGPoint(x:rect.size.width/4, y:rect.size.height*0.4 - rect.size.width*0.4))
            path.addQuadCurve(to: CGPoint(x:rect.size.width, y:rect.size.height*0.4), control: CGPoint(x:rect.size.width*3/4, y:rect.size.height*0.4 - rect.size.width*0.4))
            path.addQuadCurve(to: CGPoint(x:0, y: rect.size.height*0.4), control: CGPoint(x:rect.size.width/2, y:rect.size.height*0.4 + rect.size.width*1))

        }
    }
}

extension Shape {
    func loveEyeStyling() -> some View {
        self
            .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .square,  dash: [1], dashPhase: 2))
            .foregroundColor(Color.white)
            .glow(color: .pink, radius: 12)
    }
}

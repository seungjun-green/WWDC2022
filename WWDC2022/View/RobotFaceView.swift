//
//  RobotFaceView.swift
//  WWDC2022
//
//  Created by SeungJun Lee on 4/18/22.
//

import SwiftUI

import SwiftUI

struct RobotFacesView: View {
    var emotion: String
    
    var robotEmotion: String {
        if emotion.isEmpty || emotion == "neatural" {
            return "netural"
        } else {
            return emotion
        }
    }
    
    var body: some View {
        ZStack{
        
            FaceLineView()
        
            VStack{
                Spacer()
                EyeLineView()
                MouthView()
                Spacer()
            }
        }
    }
}


struct FaceLineView: View {
    var body: some View {
        Circle().stroke(style: StrokeStyle(lineWidth: 3, lineCap: .square,  dash: [12], dashPhase:2))
            .frame(width: 250, height: 250)
            .foregroundColor(Color.blue)
            .glow(color: .blue, radius: 12)
    }
}

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

struct MouthView: View {
    var body: some View {
       Mouth().stroke(style: StrokeStyle(lineWidth: 2, lineCap: .square,  dash: [4], dashPhase: 2))
            .frame(width: 80, height: 50)
            .foregroundColor(Color.blue)
            .glow(color: .blue, radius: 12)
    }
}


struct EyeView: View {
    var body: some View {
        Circle().stroke(style: StrokeStyle(lineWidth: 2, lineCap: .square,  dash: [4], dashPhase:2))
            .frame(width: 30, height: 30)
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


extension View {
    func glow(color: Color = .blue, radius: CGFloat = 12) -> some View {
        self
            .overlay(self.blur(radius: 4))
            .shadow(color: .blue, radius: 12)
            .shadow(color: .blue, radius: 12)
    }
}

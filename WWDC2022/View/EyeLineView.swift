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
    
    var eyeSize: Double {
        if emotion == "love" {
            return 2.0
        } else {
            return 1.0
        }
    }
    
    var body: some View {
        HStack{
            Spacer()
            if emotion == "sadness" {
                ZStack(alignment: .bottomLeading){
                    
                    
                    
                    Eye(emotion: emotion).frame(width: geo.size.height * 0.1 * eyeSize, height: geo.size.height * 0.1 * eyeSize)
                    
                    
                    TearDrop().tearstyling().frame(width: geo.size.height * 0.06 * eyeSize, height: geo.size.height * 0.06 * eyeSize)
                    
                }
            } else if emotion == "anger" {
                VStack(spacing: geo.size.height * 0.01){
                    AngryEyeBrow().mouthStyling(color: Color.white).frame(width: geo.size.height * 0.12 * eyeSize, height: geo.size.height * 0.03 * eyeSize)
                    
                    Eye(emotion: emotion).frame(width: geo.size.height * 0.1 * eyeSize, height: geo.size.height * 0.1 * eyeSize)
                }
                    
                }
             else {
                Eye(emotion: emotion).frame(width: geo.size.height * 0.1 * eyeSize, height: geo.size.height * 0.1 * eyeSize)
            }
    
            
            
            Spacer()
            
            
            if emotion == "anger" {
                VStack(spacing: geo.size.height * 0.01){
                    AngryEyeBrow2().mouthStyling(color: Color.white).frame(width: geo.size.height * 0.12 * eyeSize, height: geo.size.height * 0.03 * eyeSize)
                    
                    Eye(emotion: emotion).frame(width: geo.size.height * 0.1 * eyeSize, height: geo.size.height * 0.1 * eyeSize)
                }
            } else {
                Eye(emotion: emotion).frame(width: geo.size.height * 0.1 * eyeSize, height: geo.size.height * 0.1 * eyeSize)
            }
            
            
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




struct TearDrop: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.size.width / 2, y:0))
            path.addQuadCurve(to: CGPoint(x: rect.size.width/2, y: rect.size.height), control: CGPoint(x:rect.size.width,y: rect.size.height))
            path.addQuadCurve(to: CGPoint(x: rect.size.width/2, y:0), control: CGPoint(x:0, y: rect.size.height))
        }
        
    }
}


struct AngryEyeBrow: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 0, y:0))
            path.addLine(to: CGPoint(x: rect.size.width, y: rect.size.height))
        }
    }
}

struct AngryEyeBrow2: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.size.width, y:0))
            path.addLine(to: CGPoint(x: 0, y: rect.size.height))
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

extension Shape {
    func tearstyling() -> some View {
        self
            .stroke(style: StrokeStyle(lineWidth: 2, lineCap: .square,  dash: [3], dashPhase: 2))
            .foregroundColor(Color.blue)
           // .glow(color: .blue, radius: 2)
    }
}


/*
 
 happy eye for joy face
 blue effect for motuh when emotion is fear
 */



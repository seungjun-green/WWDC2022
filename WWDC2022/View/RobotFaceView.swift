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
        
//    var robotEmotion: String {
////        if emotion.isEmpty || emotion == "neatural" {
////            return "netural"
////        } else {
////            return emotion
////        }
//        "surprise"
//    }
    
    var colors = ["joy", "anger", "fear", "love", "surprise", "sadness"]
    @State private var robotEmotion = "joy"
    
    var body: some View {
        Picker("Please choose a color", selection: $robotEmotion) {
                                    ForEach(colors, id: \.self) {
                                        Text($0)
                                    }
                    }.pickerStyle(.segmented)
        
        VStack{
        switch robotEmotion {
        case "joy": HappyFace()
        case "anger": AngryFace()
        case "fear": FearFace()
        case "love": LoveFace()
        case "surprise": SurpriseFace()
        case "sadness": SadFace()
        default: NeturalFace()
        }
    }
    }
}


struct HappyFace: View {
    var body: some View {
        GeometryReader { geo in
            ZStack{
                FaceLineView(emotion: "joy")
                VStack{
                    MSpacer(count: 3)
                    EyeLineView(geo: geo, emotion: "joy")
                    MSpacer(count: 2)
                    HappyMouth().mouthStyling(color: Color.white).frame(width: geo.size.height * 0.47, height: geo.size.height * 0.195)
                    MSpacer(count: 3)
                }
            }
        }
        
    }
}

struct AngryFace: View {
    var body: some View {
        GeometryReader { geo in
            ZStack{

                FaceLineView(emotion: "anger")

                VStack{
                    MSpacer(count: 3)
                    EyeLineView(geo: geo, emotion: "anger")
                    MSpacer(count: 2)
                    AngryMouth().mouthStyling(color: Color.white).frame(width: geo.size.height * 0.47, height: geo.size.height * 0.195)
                    MSpacer(count: 3)
                }
            }

        }
    }
}


struct FearFace: View {
    var body: some View {
        GeometryReader {geo in
            ZStack{

                FaceLineView(emotion: "fear")

                VStack{
                    MSpacer(count: 3)
                    EyeLineView(geo: geo, emotion: "fear")
                    MSpacer(count: 2)
                    FearMouth().mouthStyling(color: Color.blue).frame(width: geo.size.height * 0.47, height: geo.size.height * 0.195)
                    MSpacer(count: 3)
                }
            }
        }
      
    }
}


struct LoveFace: View {
    var body: some View {
        GeometryReader {geo in
            ZStack{

                FaceLineView(emotion: "love")

                VStack{
                    MSpacer(count: 3)
                    EyeLineView(geo: geo, emotion: "love")
                    MSpacer(count: 2)
                    LoveMouth().mouthStyling(color: Color.white).frame(width: geo.size.height * 0.47, height: geo.size.height * 0.195)
                    MSpacer(count: 3)
                }
            }
        }
        
    }
}


struct SurpriseFace: View {
    var body: some View {
        GeometryReader {geo in
            ZStack{

                FaceLineView(emotion: "surprise")

                VStack{
                    MSpacer(count: 3)
                    EyeLineView(geo: geo, emotion: "surprise")
                    MSpacer(count: 2)
                    SurprisedMouth(geo: geo).frame(width: geo.size.height * 0.47, height: geo.size.height * 0.195)
                    MSpacer(count: 3)
                }
            }

        }
    }
}


struct SadFace: View {
    var body: some View {
        GeometryReader{geo in
            ZStack{

                FaceLineView(emotion: "sadness")

                VStack{
                    MSpacer(count: 3)
                    EyeLineView(geo: geo, emotion: "sadness")
                    MSpacer(count: 2)
                    SadMouth().mouthStyling(color: Color.white).frame(width: geo.size.height * 0.47, height: geo.size.height * 0.195)
                    MSpacer(count: 3)
                }
            }
        }
      
    }
}



struct NeturalFace: View {
    var body: some View {
        GeometryReader {geo in
            ZStack{

                FaceLineView(emotion: "netural")

                VStack{
                    MSpacer(count: 3)
                    EyeLineView(geo: geo, emotion: "netural")
                    MSpacer(count: 2)
                    NeturalMouth().mouthStyling(color: Color.white).frame(width: geo.size.height * 0.47, height: geo.size.height * 0.195)
                    MSpacer(count: 3)
                }
            }
        }
    }
}


struct MSpacer: View {
    var count: Int
    var body: some View {
        ForEach(0..<count, id: \.self) { _ in
            Spacer()
        }
    }
}

/*
 
 
 Faceline
 
 anger -> red
 others -> yellow
 
 
 */

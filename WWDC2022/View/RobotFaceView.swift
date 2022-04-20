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
//        if emotion.isEmpty || emotion == "neatural" {
//            return "netural"
//        } else {
//            return emotion
//        }
        "surprise"
    }
    
    var body: some View {
        VStack{
        switch robotEmotion {
        case "joy": HappyFace()
//        case "anger": AngryFace()
//        case "fear": FearFace()
//        case "love": LoveFace()
//        case "surprise": SurpriseFace()
//        case "sadness": SadFace()
        default: HappyFace()
        }
    }
    }
}


struct HappyFace: View {
    var body: some View {
        GeometryReader { geo in
            ZStack{
                FaceLineView()
                VStack{
                    MSpacer(count: 3)
                    EyeLineView(geo: geo)
                    MSpacer(count: 2)
                    HappyMouth().mouthStyling().frame(width: geo.size.height * 0.47, height: geo.size.height * 0.195)
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

                FaceLineView()

                VStack{
                    Spacer()
                    EyeLineView(geo: geo)
                    AngryMouth().mouthStyling().frame(width: geo.size.height * 0.47, height: geo.size.height * 0.195)
                    Spacer()
                }
            }

        }
    }
}


struct FearFace: View {
    var body: some View {
        GeometryReader {geo in
            ZStack{

                FaceLineView()

                VStack{
                    Spacer()
                    EyeLineView(geo: geo)
                    FearMouth().mouthStyling().frame(width: geo.size.height * 0.47, height: geo.size.height * 0.195)
                    Spacer()
                }
            }
        }
      
    }
}


struct LoveFace: View {
    var body: some View {
        GeometryReader {geo in
            ZStack{

                FaceLineView()

                VStack{
                    Spacer()
                    EyeLineView(geo: geo)
                    LoveMouth().mouthStyling().frame(width: geo.size.height * 0.47, height: geo.size.height * 0.195)
                    Spacer()
                }
            }
        }
        
    }
}


struct SurpriseFace: View {
    var body: some View {
        GeometryReader {geo in
            ZStack{

                FaceLineView()

                VStack{
                    Spacer()
                    EyeLineView(geo: geo)
                    SurprisedMouth().frame(width: geo.size.height * 0.47, height: geo.size.height * 0.195)
                    Spacer()
                }
            }

        }
    }
}


struct SadFace: View {
    var body: some View {
        GeometryReader{geo in
            ZStack{

                FaceLineView()

                VStack{
                    Spacer()
                    EyeLineView(geo: geo)
                    SadMouth().mouthStyling().frame(width: geo.size.height * 0.47, height: geo.size.height * 0.195)
                    Spacer()
                }
            }
        }
      
    }
}

struct NeturalFace: View {
    var body: some View {
        GeometryReader {geo in
            ZStack{

                FaceLineView()

                VStack{
                    Spacer()
                    EyeLineView(geo: geo)
                    NeturalMouth().mouthStyling().frame(width: geo.size.height * 0.47, height: geo.size.height * 0.195)
                    Spacer()
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

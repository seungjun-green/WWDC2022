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
        VStack{
            Text(emotion)
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
        ZStack{
        
            FaceLineView()
        
            VStack{
                Spacer()
                EyeLineView()
                HappyMouth().mouthStyling()
                Spacer()
            }
        }
    }
}

struct AngryFace: View {
    var body: some View {
        ZStack{
        
            FaceLineView()
        
            VStack{
                Spacer()
                EyeLineView()
                AngryMouth().mouthStyling()
                Spacer()
            }
        }
    }
}


struct FearFace: View {
    var body: some View {
        ZStack{
        
            FaceLineView()
        
            VStack{
                Spacer()
                EyeLineView()
                FearMouth().mouthStyling()
                Spacer()
            }
        }
    }
}


struct LoveFace: View {
    var body: some View {
        ZStack{
        
            FaceLineView()
        
            VStack{
                Spacer()
                EyeLineView()
                LoveMouth().mouthStyling()
                Spacer()
            }
        }
    }
}


struct SurpriseFace: View {
    var body: some View {
        ZStack{
        
            FaceLineView()
        
            VStack{
                Spacer()
                EyeLineView()
                SurprisedMouth().mouthStyling()
                Spacer()
            }
        }
    }
}


struct SadFace: View {
    var body: some View {
        ZStack{
        
            FaceLineView()
        
            VStack{
                Spacer()
                EyeLineView()
                SadMouth().mouthStyling()
                Spacer()
            }
        }
    }
}

struct NeturalFace: View {
    var body: some View {
        ZStack{
        
            FaceLineView()
        
            VStack{
                Spacer()
                EyeLineView()
                NeturalMouth().mouthStyling()
                Spacer()
            }
        }
    }
}



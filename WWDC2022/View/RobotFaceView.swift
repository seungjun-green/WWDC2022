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

extension View {
    func glow(color: Color = .blue, radius: CGFloat = 12) -> some View {
        self
            .overlay(self.blur(radius: 4))
            .shadow(color: .blue, radius: 12)
            .shadow(color: .blue, radius: 12)
    }
}

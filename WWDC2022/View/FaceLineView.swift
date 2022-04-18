//
//  FaceLineView.swift
//  WWDC2022
//
//  Created by SeungJun Lee on 4/18/22.
//

import SwiftUI

struct FaceLineView: View {
    var body: some View {
        Circle().stroke(style: StrokeStyle(lineWidth: 3, lineCap: .square,  dash: [12], dashPhase:2))
            .frame(width: 250, height: 250)
            .foregroundColor(Color.blue)
            .glow(color: .blue, radius: 12)
    }
}

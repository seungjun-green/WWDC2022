//
//  Brain.swift
//  WWDC2022
//
//  Created by SeungJun Lee on 4/20/22.
//

import CoreML
import Foundation


class Brain {
    static func get_response(label: String) -> String {
        let data = DataR()
        return data.output[label]?["responses"]?.randomElement() ?? "OK"
    }
    
    static func generateRespond(input: String) -> String {
        if input == "" {
            return "U gotta say something"
        } else {
            do {
                let config = MLModelConfiguration()
                let model = try TagClassifier1(configuration: config)
                let prediction = try model.prediction(text: input)
                return Brain.get_response(label: prediction.label)
            } catch {
                print("Some error happend")
                return "Unexpected error happend, Could you try again?"
            }
        }
    }
    
    static func getEmotion(input: String) -> String {
        do {
            let config = MLModelConfiguration()
            let model = try EmotionClassifierA(configuration: config)
            let prediction = try model.prediction(text: input)
            return prediction.label
        } catch {
            print("Some error happend")
            return "netural"
        }
    }
}

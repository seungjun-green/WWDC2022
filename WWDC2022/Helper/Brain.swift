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
        let processedString = input.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if processedString == "" {
            return "U gotta say something"
        } else {
            if processedString.starts(with: "Remember that") {
                if processedString.count == "Remember that".count {
                    return "Remember what?, Could you say that again?"
                } else {
                    // do proecess of saving
                    return "Ok, I'll remember that from now on"
                }
            } else {
                // check if input say is in question list
                let inData = [true, false].randomElement() ?? true
                if inData {
                    // if it is get the answer
                    let answer = "1234"
                    // then return the answer
                    return answer
                } else {
                    do {
                        let config = MLModelConfiguration()
                        let model = try TagClassifier1(configuration: config)
                        let prediction = try model.prediction(text: processedString)
                        return Brain.get_response(label: prediction.label)
                    } catch {
                        print("Some error happend")
                        return "Unexpected error happend, Could you try again?"
                    }
                }
                
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



/*
 
 question: My password for bycle is 1234
 answer: 1234
 
 */


/*
 
 if inpu
 
 
 */

//
//  Brain.swift
//  WWDC2022
//
//  Created by SeungJun Lee on 4/20/22.
//

import CoreML
import Foundation
import NaturalLanguage

class Brain {
    static func get_response(label: String) -> String {
        let data = DataR()
        return data.output[label]?["responses"]?.randomElement() ?? "OK"
    }
    
    static func generateRespond(input: String) -> String {
        let processedString = input.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if processedString == "" {
            // if human said nothing
            return "U gotta say something"
        } else {
            if processedString.starts(with: "Remember that") {
                if processedString.count == "Remember that".count {
                    return "Remember what?, Could you say that again?"
                } else {
                    // do proecess of saving
                    // get the questiona nd answer form then string
                    //save it to the dictionariy
                    let question = ""
                    let answer = "1234"
                    // if similar question already exist in the question list, then replace that one with a new answer
                    DataQ.question[question] = answer
                    print(DataQ.question)
                    return "Ok, I'll remember that from now on"
                }
            } else {
                // check if input say is in question list
                
                    // if it is get the answer
                    let questions = DataQ.question.keys
                    for curr_q in questions {
                        if getSimilarity(str1: processedString, str2: curr_q) >= 0.75 {
                            return DataQ.question[processedString] ?? "I don't know"
                        }
                        break
                    }
                    
                    // if human said not in Data
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
    
    static func vector(for string: String) -> [Double] {
        guard let sentenceEmbedding = NLEmbedding.sentenceEmbedding(for: .english),
              let vector = sentenceEmbedding.vector(for: string) else {
            fatalError()
        }
        return vector
    }

    static func getSimilarity(str1: String, str2: String) -> Double {
        
        let data1 = vector(for: str1)
        let data2 = vector(for: str2)
        
        let length = data1.count
        let total = data1.enumerated().reduce(0) { $0 + abs($1.1 - data2[$1.0]) }
        return 1 - (total / Double(length))
    }

}



/*
 
 question: My password for bycle is 1234
 answer: 1234
 
 */


/*
 
 if inpu
 
 
 */

//*



/*
 
 
 1. cut the string from remember that
 2. using the natural langauge, do some processeessment of getting the answer from the string
 3.
 */

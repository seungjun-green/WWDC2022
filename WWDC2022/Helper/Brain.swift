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
            /// if human said nothing
            return "U gotta say something"
        } else {
            if processedString.starts(with: "Remember that") {
                /// time to remember something
                if processedString.count == "Remember that".count {
                    /// human only said 'remember that'
                    return "Remember what?, Could you say that again?"
                } else {
                    /// human correctly used remember that phrase
                    
                    // from given input , fet the question and asnwer
                    let theQandA = Language.getQandA(input: processedString)
                    
                    let question = theQandA[0]
                    let answer = theQandA[1]
                    
                                        
                    print("the question is \(question) and answer is \(answer)")
                    
                    let questions = DataQ.question.keys
                    // if similar question already exist in the question list, then replace that one with a new answer
                    for curr_q in questions {
                        print(">>>>>>", getSimilarity(str1: question, str2: curr_q), question, curr_q)
                        if getSimilarity(str1: question, str2: curr_q) >= 0.85 {
                            DataQ.question[curr_q] = answer
                            print("updated list: ", questions)
                            return "Ok, I'll remember that from now on2"
                        }
                    }
                    
                    // if similar question does not exist, just add one more thing to rememeber
                    DataQ.question[question] = answer
                    return "Ok, I'll remember that from now on1"
                }
            } else {
                print("Whattttt????---")
                /// when human said normally, first check if human asked things human made the bot to remember
                
                // check if input say is in question list
                    let questions = DataQ.question.keys
                print("MMMMMMMMMM",questions)
                    for curr_q in questions {
                        print(getSimilarity(str1: processedString, str2: curr_q), curr_q)
                        if getSimilarity(str1: processedString, str2: curr_q) >= 0.7 {
                            return DataQ.question[curr_q] ?? "I don't know"
                        }
                        
                    }
                    
                    /// human was just chlling out, no problem :)
                    do {
                        let config = MLModelConfiguration()
                        let model = try TagClassifier2(configuration: config)
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

class Language {
    static func getLexicalClass(text: String) -> [String] {
        let tagger = NLTagger(tagSchemes: [.lexicalClass])
        tagger.string = text
        
        var tags = [String]()
        let options: NLTagger.Options = [.omitPunctuation, .omitWhitespace]
        tagger.enumerateTags(in: text.startIndex..<text.endIndex, unit: .word, scheme: .lexicalClass, options: options) { (tag, tokenRange) -> Bool in
            if let tag = tag {
                tags.append(tag.rawValue)
            }
            return true
        }
        return tags
    }
    
    static func getQandA(input: String) -> [String] {
        
        let text = input
        let tokenizer = NLTokenizer(unit: .word)
        tokenizer.string = text

        var curr_data = [String]()

        tokenizer.enumerateTokens(in: text.startIndex..<text.endIndex) { tokenRange, _ in
            curr_data.append(String(text[tokenRange]))
            return true
        }

        let tags = getLexicalClass(text: text)
        var pivot = 0

        for (index, tag) in tags.enumerated() {
            if String(tag) == "Verb" && index != 0{
                pivot = index
                break
            }
        }

        let question = curr_data[2...pivot].joined(separator: " ")
        let answer = curr_data.suffix(from:pivot+1).joined(separator: " ")
        
        return [question, answer]
    }
    
    
}

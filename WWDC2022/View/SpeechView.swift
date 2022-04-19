//
//  SpeechView.swift
//  WWDC2022
//
//  Created by SeungJun Lee on 4/18/22.
//
import CoreML
import Speech
import SwiftUI

struct SpeechView: View {
    @Binding var userIsSpeaking: Bool
    @Binding var humanSay: String
    @Binding var isActive: Bool
    @Binding var shownText: String
    @Binding var robotSay: String
    @Binding var emotion: String
    
    @State private var audioRecorder: AVAudioRecorder!
    @State private var recording = false
    @State private var transcribedText = ""
    
    var body: some View {
        VStack{
            Text("ddd")
            Text(transcribedText)
            Button(action: {
                
                
                if userIsSpeaking {
                    
                    // stop recording
                    
                    // trabscribe the recorded audio file
                    
                    //generate respond
                    getEmotion(input: humanSay)
                    generateRespond(input: humanSay)
                    
                    shownText = ""
                    isActive = true
                    
                    
                   stopRecording()
                } else {
                    requestPermission()
                    // start recordingk
                 startRecording()
                }
                
                userIsSpeaking.toggle()
                
            }, label: {
                
                if userIsSpeaking {
                    MicAnimationView().frame(height: 110)
                } else {
                    
                    VStack{
                        Image(systemName: "mic.circle")
                            .resizable()
                            .foregroundColor(.blue)
                            .frame(width: 70, height: 70)
                    }.frame(height: 110)
                }
                
            })
        }.onAppear{
            //requestPermission()
        }
    }
    
    func transcribeAudio(url: URL) {
            // create a new recognizer and point it at our audio
            let recognizer = SFSpeechRecognizer()
            let request = SFSpeechURLRecognitionRequest(url: url)
            
            // start recognition!
            recognizer?.recognitionTask(with: request) { (result, error) in
                // abort if we didn't get any transcription back
                guard let result = result else {
                    print("There was an error: \(error!)")
                    return
                }
                print("transcribin1g")
                // if we got the final transcription back, print it
                if result.isFinal {
                    // pull out the best transcription...
                    print("transcribing")
                    print(result.bestTranscription.formattedString)
                    transcribedText = result.bestTranscription.formattedString
                }
            }
        }
    
    func stopRecording() {
            audioRecorder.stop()
            recording = false
            
            fetchRecordings()
        }
    
    func fetchRecordings() {
            
            let fileManager = FileManager.default
            let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let directoryContents = try! fileManager.contentsOfDirectory(at: documentDirectory, includingPropertiesForKeys: nil)
            for audio in directoryContents {
                print("----")
                transcribeAudio(url: audio)
            }
            
            
        }
    
    func startRecording() {
            let recordingSession = AVAudioSession.sharedInstance()
            
            do {
                try recordingSession.setCategory(.playAndRecord, mode: .default)
                try recordingSession.setActive(true)
            } catch {
                print("Failed to set up recording session")
            }
            
            let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let audioFilename = documentPath.appendingPathComponent("human.m4a")
            
            let settings = [
                AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
                AVSampleRateKey: 12000,
                AVNumberOfChannelsKey: 1,
                AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
            ]
            
            do {
                audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
                audioRecorder.record()
                recording = true
            } catch {
                print("Could not start recording")
            }
        }
    
    func requestPermission() {
            SFSpeechRecognizer.requestAuthorization { authStatus in
                if authStatus == .authorized {
                    print("Thanks")
                } else {
                    print("Speech Failed")
                }
            }
        }
    
    func getEmotion(input: String) {
        do {
            let config = MLModelConfiguration()
            let model = try EmotionClassifierPro(configuration: config)
            let prediction = try model.prediction(text: input)
            emotion = prediction.label
        } catch {
            print("Some error happend")
        }
    }
    
    func generateRespond(input: String){
        do {
            let config = MLModelConfiguration()
            let model = try TagClassifier1(configuration: config)
            let prediction = try model.prediction(text: humanSay)
            robotSay =  get_response(label: prediction.label)
            //speak(sentence: robotSay)
        } catch {
            print("Some error happend")
            speak(sentence: "Unexpected error happend, Could you try again?")
        }
    }
    
    func speak(sentence: String) {
        let utterance = AVSpeechUtterance(string: sentence)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
    
    func get_response(label: String) -> String {
        let data = DataR()
        return data.output[label]?["responses"]?.randomElement() ?? "OK"
    }
    
}

struct MicAnimationView: View {
    
    var barHeight: CGFloat {
        CGFloat(Int.random(in: 25..<100))
    }
    
    var body: some View {
        TimelineView(.periodic(from: Date(), by: 0.085)){ context in
            HStack{
                ForEach(0..<20) { _ in
                    Rectangle().fill(Color.blue).frame(width: 3, height: barHeight)
                }
            }
        }
    }
}

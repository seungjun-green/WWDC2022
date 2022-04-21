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
    @Binding var robotTyping: Bool
    @Binding var shownText: String
    @Binding var robotSay: String
    @Binding var emotion: String
    @Binding var transcribeDone: Bool
    @Binding var recording: Bool
    
    @State private var audioRecorder: AVAudioRecorder!
    @State private var transcribedText = ""
    @State private var errorHappend = false
        
    var transcribing: Bool {
        transcribedText.isEmpty && errorHappend == false && robotTyping
    }

    var body: some View {
        VStack{
            TimelineView(.animation) { _ in
                if transcribing {
                        ProgressView()
                } else {
                    Text(transcribedText).onAppear{
                        transcribeDone = true
                        
                    }
                }
            }
                        
            Button(action: {
                
                if userIsSpeaking {
                    shownText = ""
                    robotTyping = true
                    stopRecording()
                } else {
                    errorHappend = false
                    transcribedText = ""
                    transcribeDone = false
                    Speech.requestPermission()
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
            robotTyping = false
        }
    }
    
    
    func transcribeAudio(url: URL) {
            let recognizer = SFSpeechRecognizer()
            let request = SFSpeechURLRecognitionRequest(url: url)
            
            recognizer?.recognitionTask(with: request) { (result, error) in
                
                guard let result = result else {
                    print("some error happend")
                    humanSay = ""
                    errorHappend = true
                    
                    emotion = Brain.getEmotion(input: humanSay)
                    robotSay = Brain.generateRespond(input: humanSay)
                    
                    return
                }
                
                if result.isFinal {
                    transcribedText = result.bestTranscription.formattedString
                    humanSay = transcribedText
                    
                    emotion = Brain.getEmotion(input: humanSay)
                    robotSay = Brain.generateRespond(input: humanSay)
                    
                    
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
                transcribeAudio(url: audio)
            }
        }
    
    func startRecording() {
            let recordingSession = AVAudioSession.sharedInstance()
            
            do {
                try recordingSession.setCategory(.playAndRecord, mode: .default)
                try recordingSession.setActive(true)
            } catch {
                print("Some error happened")
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

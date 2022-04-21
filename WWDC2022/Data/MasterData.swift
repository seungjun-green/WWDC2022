//
//  MasterData.swift
//  WWDC2022
//
//  Created by SeungJun Lee on 4/18/22.
//

import Foundation

class DataR {
    let output = [
        "greetings": [
            "patterns": ["yo", "hey", "What's up", "Good day", "Good Morning", "Good Evening", "Goood Afternoon", "How's your day have been?", "How is it going?"],
            "responses": ["Hello", "Hi there!", "Hey!"]
        ],
        "goodbye": [
            "patterns": ["bye", "see you", "have a nice day"],
            "responses": ["Bye", "Ok, See you then", "It was nice meeting you", "Take care", "Goodbye for now", "I'll see you later"]
        ],
        "name": [
            "patterns": ["What's your name?", "What is your name?", "Your Name?", "What should I call you?"],
            "responses":["I'm XE42", "You can call me XE42","I'm XE42"]
        ],
        "time": [
            "patterns": ["time?","What time is it now", "Current time?", "Can you tell me the time, please?", "I would like to know the time.", "Is it time for lunch yet?"],
            "responses": ["Hmmmm, It's always time for launch somewhere in this Earth"]
        ],
        "weather": [
            "patterns": ["weather?","What is the current weather like?", "What's the weather like right now?", "Is it raining outside?", "What's the temperature right now?"],
            "responses": ["Sorry, I also don't know what time it is", "Hmm, I guess time for snacks?"]
        ],
        "age": [
            "patterns": ["How old are you?","What is your age?", "I would like to know your age.", "Could you tell me your age?", "May I ask your age?", "Can I ask how old you are?"],
            "responses": ["I'm 1 month old", "I stopped counting my age from some point of my life"]
        ]
    ]
}



class DataQ {
    static var question = [
        "My name is Seungjun": "Seungjun"
    ]
}

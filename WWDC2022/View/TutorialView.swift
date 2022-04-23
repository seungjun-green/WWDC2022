//
//  TutorialView.swift
//  WWDC2022
//
//  Created by SeungJun Lee on 4/24/22.
//

import SwiftUI

struct TutorialView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading) {
                    Text("Things to test").font(.largeTitle).fontWeight(.medium)
                }
                
                VStack(alignment: .leading){
                    Text("1.Making bot to remember something").font(.headline).fontWeight(.bold)
                    Text("\n")
                    Text("Start your sentence with 'Remember that'\n")
                    
                    Text("EXAMPLE:").fontWeight(.bold)
                    Text("Say 'Remember that my macbook password is 1234'\nSay 'Remember thay my iPhone password is 9876'\n\nThen Ask 'What is my macbook password'\nAsk 'What is my iPhone password'")
                }
                
                Text("\n\n")
                
                
                
                
                
                VStack(alignment: .leading){
                    Text("2.Updating saved information").font(.headline).fontWeight(.bold)
                    Text("\n")
                    Text("EXAMPLE:").fontWeight(.bold)
                    Text("Say 'Remember that my macbook password is abcd'\nThen ask again 'What is my macbook password'")
                }
                
                Text("\n\n")
                
                
                
                VStack(alignment: .leading){
                    Text("3.Normal Conversation").font(.headline).fontWeight(.bold)
                    Text("\n")
                    Text("EXAMPLE:").fontWeight(.bold)
                    Text("Say 'hi' or 'What is the current time? and so on\n")
                }
            }.toolbar {
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button("Ok") {
                            dismiss()
                        }
                    }
                }
            
        }
    }
}


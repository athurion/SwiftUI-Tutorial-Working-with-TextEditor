//
//  ContentView.swift
//  SwiftUI Tutorial: Working with TextEditor
//
//  Created by Alvin Sosangyo on 01/31/22.
//


import SwiftUI

struct ContentView: View {
    
    @State private var inputText: String = "" //Input text variable
    @State private var wordCounter: Int = 0 //Count the number of words
    
    var body: some View {
        
        ZStack {
            Color.blue
                .ignoresSafeArea(.all)
            
            VStack {

                Text("Write down your thoughts")
                    .font(.title3)
                    .foregroundColor(.white)
                
                //Uses plural form if there are 2 or more words
                Text(wordCounter <= 1 ? "\(wordCounter) word" : "\(wordCounter) words")
                    .font(.title3)
                    .foregroundColor(.white)

                TextEditor(text: $inputText)
                    .font(.custom("Futura", size: 20))
                    .onChange(of: inputText) { newValue in
                        let words = inputText.split { $0 == " " || $0.isNewline }
                        self.wordCounter = words.count
                    }
                
            } //VStack
            
        } //ZStack
        
    } //body
    
} //ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


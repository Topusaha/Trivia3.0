//
//  ContentView.swift
//  TriviaApp
//
//  Created by Topu Saha on 3/26/24.
//


import SwiftUI

struct ContentView: View {
    
    // replace later with categories of the API
    var categories = ["1", "2", "3"]
    var difficultyOptions = ["Easy", "Medium", "Hard"]
    var questionTypes = ["Multiple Choice", "True or False"]
    
    @State private var numQuestions : Int = 5
    @State private var selectedCategory : String = "PlaceHolder" // Change Later
    @State var difficulty : Double = 0.0
    @State var typeOfQuestion : String = "Multiple Choice"
    
    var body: some View {
        
        
        
        NavigationView {
            ZStack {
                VStack {
                    Form {
                        
                        // allow user to input number of questions
                        TextField("Enter Amount of Questions", value: $numQuestions, formatter: NumberFormatter())
                        
                        
                        // allow user to select category
                        Picker("Select Category", selection: $selectedCategory) {
                            ForEach(categories, id: \.self) {
                                Text($0)
                            }
                        }
                        
                        // Slider for level
                        HStack {
                            Text("Difficulty \(difficultyOptions[Int(difficulty)])")
                            Slider(
                                value: $difficulty,
                                in: 0...2,
                                step: 1)
                        }
                        
                        // Select type of question
                        Picker("Question Type", selection: $typeOfQuestion) {
                            ForEach(questionTypes, id: \.self) {
                                Text($0)
                            }
                        }
                        
                        // Select Timer (Extra Do Later)
                    }
                    .navigationTitle(Text("Trivia Game"))
                    .padding(.top, 10)
                    
                     
                    
                    Section {
                        Button("Button") {
                            print("Hello World")
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.green)
                        .padding()
                    }
                    
                }
                .background(Color.blue)
                
                
            }
            
            
        }
        
        
           
        
        
            
            
            
            
            
        }
         
        
        

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



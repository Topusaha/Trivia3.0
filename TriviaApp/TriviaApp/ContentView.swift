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
    
    @State private var numQuestions : Int = 5
    @State private var selectedCategory : String = "PlaceHolder" // Change Later
    @State var difficulty : Double = 0.0
    
    var body: some View {
        
        
        
        
        Form {
            
            Section {
                    Text("Trivia App")
                        .font(.title)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity)
                }
                .listRowBackground(Color.blue)
            
        
                
                
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
            }
            
            
            
            
        }
         
        
        

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

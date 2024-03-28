//
//  PlayView.swift
//  TriviaApp
//
//  Created by Topu Saha on 3/28/24.
//

import SwiftUI

struct PlayView: View {
    @State private var amount : Int
    @State private var categoryIndex : Int
    @State private var difficulty : String
   // @State private var typeOfQuestion : String
    
    
    init(amount: Int, categoryIndex: Int, difficulty: String) {
           self._amount = State(initialValue: amount)
           self._categoryIndex = State(initialValue: categoryIndex)
           self._difficulty = State(initialValue: difficulty)
        
       }
     
    
    
    var body: some View {
        
        VStack {
            
        }
        .onAppear(perform: {
            Task {
                await fetchQuestions(amount: $amount, categoryIndex: $categoryIndex, difficulty: $difficulty)
            }
        })
    }
    
    private func fetchQuestions(amount : Binding<Int>, categoryIndex : Binding<Int>, difficulty : Binding<String>) async {
        
        Task {
            // build url
            let url : URL = URL(string: "https://opentdb.com/api.php?amount=10")!
            
            // Call Api
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                
                let questionsResponse = try JSONDecoder().decode(questionsResponse.self, from: data)
                
                let questions = questionsResponse.data
                
                for question in questions {
                    print(question)
                }
                
            }
            catch {
                print(error.localizedDescription)
            }
        }
        
       
        
    }
}



    



struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView(amount: 10, categoryIndex: 8, difficulty: "Hard")
    }
}

//
//  ContentView.swift
//  TriviaApp
//
//  Created by Topu Saha on 3/26/24.
//


import SwiftUI

struct ContentView: View {
    
    
    var difficultyOptions = ["Easy", "Medium", "Hard"]
    var questionTypes = ["Multiple Choice", "True or False"]
    
    
    @State private var categories = [String]()
    @State private var categoriesID = [Int]()
    @State private var numQuestions : Int = 5
    @State private var selectedCategory : String = ""
    @State private var difficulty : Double = 0.0
    @State private var typeOfQuestion : String = "Multiple Choice"
    @State private var selectedCategoryID = 8
    
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
                            Slider(value: $difficulty, in: 0...2, step: 1)
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
                    .onAppear(perform: {
                        Task {
                            await getCategories()
                        }
                    })
                    
                     
                    
                    Section {
                        Button("Start") {
                            selectedCategoryID = getCategoryID(category: selectedCategory)
                            print(selectedCategoryID)
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
         
    // get API categories
    private func getCategories() async {
        let url = URL(string: "https://opentdb.com/api_category.php")!
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let response = try JSONDecoder().decode(CategoriesResponse.self, from: data)
            
            
            categories = response.trivia_categories.map{$0.name}
            categoriesID = response.trivia_categories.map{$0.id}
        } catch {
            print(error.localizedDescription)
        }
    }
    
    // use this method to match the category to the index and call it when the button is tapped
    private func getCategoryID(category : String) -> Int {
        let index = categories.firstIndex(of: category) ?? 8
        return categoriesID[index]
    }
        

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



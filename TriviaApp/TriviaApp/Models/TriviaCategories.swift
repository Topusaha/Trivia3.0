//
//  TriviaCategories.swift
//  TriviaApp
//
//  Created by Topu Saha on 3/28/24.
//

import Foundation


// Define a struct to represent the category
struct CategoriesResponse : Codable {
    let trivia_categories: [TriviaCategory]
}

struct TriviaCategory : Codable, Hashable, Identifiable {
    let id: Int
    let name: String
}

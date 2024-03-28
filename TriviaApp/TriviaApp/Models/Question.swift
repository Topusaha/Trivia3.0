//
//  Question.swift
//  TriviaApp
//
//  Created by Topu Saha on 3/28/24.
//

import Foundation


struct Question: Codable {
    
    // useful variables
    let question : String
    let correct_answer : String
    let incorrect_answer : [String]
    
    
    // not useful variables
    let difficulty : String
    let type : String
    let category : String
    
    
}

struct questionsResponse: Codable {
    let data : [Question]
}


/*
 
 {
       "type": "multiple",
       "difficulty": "easy",
       "category": "History",
       "question": "How long did World War II last?",
       "correct_answer": "6 years",
       "incorrect_answers": [
         "4 years",
         "5 years",
         "7 years"
       ]
 */

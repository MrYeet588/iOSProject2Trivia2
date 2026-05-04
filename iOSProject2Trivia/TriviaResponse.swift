//
//  TriviaResponse.swift
//  
//
//  Created by Student on 4/30/26.
//

struct TriviaResponse: Codable {
    let results: [Question]
}

struct Question: Identifiable, Codable {
    var type: String
    var difficulty: String
    var category: String
    var question: String
    var correct_answer: String
    var incorrect_answers: [String]
}

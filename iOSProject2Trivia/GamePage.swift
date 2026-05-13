//
//  GamePage.swift
//  iOSProject2Trivia
//
//  Created by Student on 5/6/26.
//

import SwiftUI

struct GamePage: View {
    
    @State private var questions: [Question] = []
    @State private var currentQuestionIndex = 0
    @State private var answerSelected = false
    @State private var selectedAnswer = ""
    @State private var score = 0
    
    var currentQuestion: Question {
        questions[currentQuestionIndex]
    }
    
    var answers: [String] {
        if currentQuestion.type == "boolean" {
            return [
                currentQuestion.correct_answer,
                currentQuestion.incorrect_answers[0]
            ].shuffled()
        }
        
        return (
            currentQuestion.incorrect_answers +
            [currentQuestion.correct_answer]
        ).shuffled()
    }
    
    var body: some View {
        
        ZStack {
            
            Color.yellow
                .ignoresSafeArea()
            
            ScrollView {
                
                VStack(spacing: 20) {
                    
                    if questions.isEmpty {
                        
                        ProgressView("Loading Questions...")
                        
                    } else {
                        
                        Text("Question \(currentQuestionIndex + 1)/\(questions.count)")
                            .font(.headline)
                        
                        Text(currentQuestion.question.safeHTMLDecoded)
                            .font(.title3)
                            .multilineTextAlignment(.center)
                            .padding()
                            .fixedSize(horizontal: false, vertical: true)
                        
                        ForEach(answers, id: \.self) { answer in
                            
                            Button {
                                
                                selectedAnswer = answer
                                answerSelected = true
                                
                                if answer == currentQuestion.correct_answer {
                                    score += 1
                                }
                                
                            } label: {
                                
                                Text(answer.safeHTMLDecoded)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(buttonColor(answer))
                                    .foregroundColor(.white)
                                    .cornerRadius(12)
                            }
                            .disabled(answerSelected)
                        }
                        
                        if answerSelected {
                            
                            Button("Next Question") {
                                nextQuestion()
                            }
                            .padding()
                        }
                        
                        Text("Score: \(score)")
                            .font(.title2)
                    }
                }
                .padding()
            }
        }
        .task {
            await fetchQuestions()
        }
    }
    
    func buttonColor(_ answer: String) -> Color {
        
        if !answerSelected {
            return .blue
        }
        
        if answer == currentQuestion.correct_answer {
            return .green
        }
        
        if answer == selectedAnswer {
            return .red
        }
        
        return .gray
    }
    
    func nextQuestion() {
        
        answerSelected = false
        selectedAnswer = ""
        
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        }
    }
    
    func fetchQuestions() async {
        
        let urlString = "https://opentdb.com/api.php?amount=10"
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        do {
            
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let triviaResponse = try JSONDecoder().decode(
                TriviaResponse.self,
                from: data
            )
            
            questions = triviaResponse.results
            
        } catch {
            print(error)
        }
    }
}

#Preview {
    GamePage()
}

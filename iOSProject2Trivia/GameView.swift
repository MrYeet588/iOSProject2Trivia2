//
//  SwiftUIView.swift
//
//
//  Created by Student on 4/27/26.
//

import SwiftUI

struct GameView: View {
    @State private var questions: [Question] = []
    
    var body: some View {
        List {
            ForEach(questions) { q in
                Text(q.question)
            }
        }
        .task {
            let urlStr: String = "https://opentdb.com/api.php?amount=1"
            let url: URL? = URL(string: urlStr)
            guard let urlUnwrapped = url else {
                return
            }
            do {
                let (data, response) = try await URLSession.shared.data(from: urlUnwrapped)
                let responseConverted = response as! HTTPURLResponse
                let triviaResponse: TriviaResponse = try JSONDecoder().decode(TriviaResponse.self, from: data)
                for question in triviaResponse.results {
                    questions.append(question)
                }
            } catch let error {
                print(error)
            }
        }
    }
}

#Preview {
    GameView()
}

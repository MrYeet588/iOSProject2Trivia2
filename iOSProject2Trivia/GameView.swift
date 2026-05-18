//
//  SwiftUIView.swift
//
//
//  Created by Student on 4/27/26.
//

import SwiftUI
import Foundation

extension String {
    var safeHTMLDecoded: String {
        let entities: [String: String] = [
            "&quot;": "\"",
            "&amp;": "&",
            "&#039;": "'",
            "&rsquo;": "'",
            "&lsquo;": "'",
            "&ldquo;": "\"",
            "&rdquo;": "\"",
            "&ndash;": "–",
            "&mdash;": "—",
            "&eacute;": "é",
            "&pi;": "π",
            "&tilde;": "~",
            "&deg;": "°"
        ]
        var decoded = self
        for (entity, replacement) in entities {
            decoded = decoded.replacingOccurrences(of: entity, with: replacement)
        }
        return decoded
    }
}

struct GameView: View {
    let apiDifficulty: String
    @State private var questions: [Question] = []
    
    var body: some View {
        List {
            ForEach(questions) { q in
                Text(q.question.safeHTMLDecoded)
            }
        }
        .task {
            let urlStr: String = "https://opentdb.com/api.php?amount=1\(apiDifficulty)"
            let url: URL? = URL(string: urlStr)
            guard let urlUnwrapped = url else {
                return
            }
            do {
                let (data, _) = try await URLSession.shared.data(from: urlUnwrapped)
                let triviaResponse: TriviaResponse = try JSONDecoder().decode(TriviaResponse.self, from: data)
                for question in triviaResponse.results! {
                    questions.append(question)
                }
            } catch let error {
                print(error)
            }
        }
    }
}

#Preview {
    GameView(apiDifficulty: "")
}

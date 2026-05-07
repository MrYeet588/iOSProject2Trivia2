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
        let entities = [
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
            "&pi;": "π"
        ]
        var decoded = self
        for (entity, replacement) in entities {
            decoded = decoded.replacingOccurrences(of: entity, with: replacement)
        }
        return decoded
    }
}

struct GameView: View {
    @State private var questions: [Question] = []
    
    var body: some View {
        List {
            ForEach(questions) { q in
                //&amp = & | &quot; = " | &#039; = ' | &ndash = - | @eacute; = é
                if (q.question.contains("&quot;") == true) {
                    let qwe = q.question.replacingOccurrences(of: "&quot;", with: "\"")
                    Text(qwe)
                } else if (q.question.contains("&amp")){
                    let qwe = q.question.replacingOccurrences(of: "&amp", with: "&")
                    Text(qwe)
                } else if (q.question.contains("&#039;")){
                    let qwe = q.question.replacingOccurrences(of: "&#039;", with: "\'")
                    Text(qwe)
                } else if (q.question.contains("&ndash")){
                    let qwe = q.question.replacingOccurrences(of: "&ndash", with: "-")
                    Text(qwe)
                } else if (q.question.contains("&eacute;")){
                    let qwe = q.question.replacingOccurrences(of: "&eacute;", with: "é")
                    Text(qwe)
                }
                else {
                    Text(q.question)
                }
                Text(q.question.safeHTMLDecoded)
            }
        }
        .task {
            let urlStr: String = "https://opentdb.com/api.php?amount=4"
            let url: URL? = URL(string: urlStr)
            guard let urlUnwrapped = url else {
                return
            }
            do {
                let (data, _) = try await URLSession.shared.data(from: urlUnwrapped)
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
//

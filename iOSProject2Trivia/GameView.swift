//
//  SwiftUIView.swift
//
//
//  Created by Student on 4/27/26.
//

import SwiftUI
import Foundation

/*extension String {                ignore this for now
    var htmlDecoded: String {
        guard let data = self.data(using: .utf8) else { return self }
        let options: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]
        if let attributedString = try? NSAttributedString(data: data, options: options, documentAttributes: nil) {
            return attributedString.string
        }
        return self
    }
}*/

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
                } else if (q.question.contains("&#039")){
                    let qwe = q.question.replacingOccurrences(of: "&#039", with: "\'")
                    Text(qwe)
                } else if (q.question.contains("&ndash")){
                    let qwe = q.question.replacingOccurrences(of: "&ndash", with: "-")
                    Text(qwe)
                } else if (q.question.contains("@eacute;")){
                    let qwe = q.question.replacingOccurrences(of: "&eacute;", with: "é")
                    Text(qwe)
                }
                else {
                    Text(q.question)
                }
                //Text(q.question.htmlDecoded)
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
                _ = response as! HTTPURLResponse
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

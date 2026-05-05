//
//  SwiftUIView.swift
//  
//
//  Created by Student on 4/27/26.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var questions: [Question] = []
    
    var body: some View {
        List {
            ForEach(
        }
            Text(apiData)
                .task {
                    let urlStr: String = "https://opentdb.com/api.php?amount=1"
                    let url: URL? = URL(string: urlStr)
                    guard let urlUnwrapped = url else {
                        return
                    }
                    do {
                        let (data, response) = try await URLSession.shared.data(from: urlUnwrapped)
                        let responseConverted = response as! HTTPURLResponse
                        let printableData: String = String(decoding: data, as: UTF8.self)
                        apiData = printableData
                    } catch let error {
                        print(error)
                    }
                }
        }
}

#Preview {
    SwiftUIView()
}

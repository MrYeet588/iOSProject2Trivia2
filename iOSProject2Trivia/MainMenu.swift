//
//  MainMenu.swift
//  iOSProject2Trivia
//
//  Created by Student on 5/5/26.
//
import SwiftUI

struct MainMenu: View{
    @State var background_color_toggle = true
    var body: some View {

        NavigationStack {
                Color(background_color_toggle ? .green : .blue)
                    .ignoresSafeArea(.container, edges: .all)
                    .rotation3DEffect(.degrees(background_color_toggle ? 360 : 0), axis: (1, 1, 1))
                    .animation(.easeInOut(duration: 5).repeatForever(autoreverses: false), value: background_color_toggle)
                    .onTapGesture {
                        background_color_toggle.toggle()
                    }
                
                VStack {
                    Text("WELCOME TO LE GAME OF TRIVIANESS")
                    NavigationLink(destination: {
                        GameView()
                    }, label: {
                        Label("Start Quiz", systemImage: "questionmark")
                    })
                    Button("Select Difficulty") {
                        
                    }
                }
        }
    }
}

#Preview {
    MainMenu()
}

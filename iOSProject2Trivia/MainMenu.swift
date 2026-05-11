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
        ZStack {
            //https://docs.google.com/presentation/d/1SX3slv3PoSi0pKub7uBWbfj24rj9-setgzMwNfaeyfU/edit?slide=id.g393871f7b85_0_0#slide=id.g393871f7b85_0_0
            //navigation tutorial
            Color(background_color_toggle ? .green : .blue)
                .ignoresSafeArea(.container, edges: .all)
                .rotation3DEffect(.degrees(background_color_toggle ? 360 : 0), axis: (1, 1, 1))
                .animation(.easeInOut(duration: 5).repeatForever(autoreverses: false), value: background_color_toggle)
                .onTapGesture {
                    background_color_toggle.toggle()
                }
            
            VStack {
                Text("Hello")
                Button("Start Quiz") {
                    
                }
                Button("Select Difficulty") {
                    
                }
            }
            
        }


    }
}


#Preview {
    MainMenu()
}

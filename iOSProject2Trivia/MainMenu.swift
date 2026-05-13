//
//  MainMenu.swift
//  iOSProject2Trivia
//
//  Created by Student on 5/5/26.
//
import SwiftUI

struct MainMenu: View{
    @State var background_color_toggle = true
    @State var scale = 0.0
    @State var screenTapped = false
    var body: some View {

        NavigationStack {
            ZStack{
                
                Color(background_color_toggle ? .green : .blue)
                    .ignoresSafeArea(.container, edges: .all)
                    .animation(.linear(duration: 5), value: background_color_toggle)
                    .onTapGesture {
                        background_color_toggle.toggle()
                        screenTapped = true
                    }
                if (screenTapped){
                    Circle()
                        .scaleEffect(scale)
                        .animation(.easeIn,value: scale)
                        .onAppear {
                            scale += 1
                        }
                }
                VStack {
                    Text("WELCOME TO LE GAME OF TRIVIANESS")
                    NavigationLink(destination: {
                        GamePage()
                    }, label: {
                        Label("Start Quiz", systemImage: "")
                    })
                    Button("Select Difficulty") {
                        
                    }
                }
            }
        }
    }
}

#Preview {
    MainMenu()
}

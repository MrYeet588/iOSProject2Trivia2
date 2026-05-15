//
//  MainMenu.swift
//  iOSProject2Trivia
//
//  Created by Student on 5/5/26.
//
import SwiftUI

struct MainMenu: View {
    @State private var background_color_toggle = false
    @State private var screenTapped = false
    @State private var scale: CGFloat = 0
    @State private var duration = 1.5
    @State private var diffButt = "Select Difficulty"
    @State private var diffButtPress = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(background_color_toggle ? .green : .blue)
                    .ignoresSafeArea()
                
                    Circle()
                        .fill(Color(background_color_toggle ? .blue : .green))
                        .scaleEffect(scale)
                        .frame(width: UIScreen.main.bounds.width * 2,
                               height: UIScreen.main.bounds.height * 2)
                
                VStack(spacing: 20) {
                    Text("WELCOME TO LE GAME OF TRIVIANESS")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    NavigationLink(destination: GamePage()) {
                        Text("Start Quiz")
                            .font(.title3)
                            .padding()
                            .background(Color.white.opacity(0.3))
                            .cornerRadius(10)
                    }
                    
                    Button(diffButt) {
                        diffButtPress = true
                    }
                    .font(.title3)
                    .padding()
                    .background(Color.white.opacity(0.3))
                    .cornerRadius(10)
                    if (diffButtPress){
                        HStack{
                            Button("Easy") {
                                diffButtPress = false
                                diffButt = "Easy"
                            }
                            .font(.caption2)
                            .padding(10)
                            .background(Color.white.opacity(0.3))
                            .cornerRadius(10)
                            Button("Medium") {
                                diffButtPress = false
                                diffButt = "Medium"
                            }
                            .font(.caption2)
                            .padding(10)
                            .background(Color.white.opacity(0.3))
                            .cornerRadius(10)
                            Button("Hard") {
                                diffButtPress = false
                                diffButt = "Hard"
                            }
                            .font(.caption2)
                            .padding(10)
                            .background(Color.white.opacity(0.3))
                            .cornerRadius(10)
                            Button("Default") {
                                diffButtPress = false
                                diffButt = "Default"
                            }
                            .font(.caption2)
                            .padding(10)
                            .background(Color.white.opacity(0.3))
                            .cornerRadius(10)
                        }
                    }
                }
                .foregroundColor(.white)
            }
            .onTapGesture {
                withAnimation(.easeInOut(duration: duration)) {
                    scale = 2
                } completion: {
                    background_color_toggle.toggle()
                    scale = 0
                }
            }
        }
    }
}
#Preview {
    MainMenu()
}




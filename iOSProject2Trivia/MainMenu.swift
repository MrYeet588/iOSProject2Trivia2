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
            
            Color(background_color_toggle ? .red : .blue)
                .ignoresSafeArea(.container, edges: .all)
                .rotation3DEffect(.degrees(background_color_toggle ? 360 : 0), axis: (1, 1, 1))
                .animation(.easeInOut(duration: 0.04).repeatForever(autoreverses: false), value: background_color_toggle)
                .onTapGesture {
                    background_color_toggle.toggle()
                }
            Text("Hello")
            NavigationStack {
                VStack{
                    NavigationLink(destination: {
                        des1()
                        
                    }, label : {
                        Text("click")
                    })
                }
            }
        }


    }
}
struct des1 : View {
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
    }
}

#Preview {
    MainMenu()
}

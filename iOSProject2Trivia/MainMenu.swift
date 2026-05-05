//
//  MainMenu.swift
//  iOSProject2Trivia
//
//  Created by Student on 5/5/26.
//
import SwiftUI

struct MainMenu: View{
    @State private var someValue = true
    @State private var angle = 0.0
    @State private var applyClip = false
    @State private var angle2 = true
    var body: some View {
        Rectangle()
            .frame(width: 100, height: 100)
            .foregroundColor(.blue)
            .clipShape(RoundedRectangle(cornerRadius: applyClip ? 50 : 0))
            .animation(.linear(duration: 1), value: applyClip)
            .onTapGesture {
                applyClip = !applyClip
            }
            .rotation3DEffect(.degrees(angle2 ? 360 : 0), axis: (0, 1, 1))
            .animation(.linear(duration: 2), value: angle2)
    }
}


#Preview {
    MainMenu()
}

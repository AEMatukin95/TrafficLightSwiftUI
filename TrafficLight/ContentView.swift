//
//  ContentView.swift
//  TrafficLight
//
//  Created by Александр Матукин on 21.01.2022.
//

import SwiftUI

enum CurrentLight{
    case red, yellow, green
}

struct ContentView: View {
    private var circleRed = CircleView(color: .red, activeOpacity: false)
    private var circleYellow = CircleView(color: .yellow, activeOpacity: false)
    private var circleGreen = CircleView(color: .green, activeOpacity: false)

    @State private var nameTap = "Start"
    @State private var currentLight = CurrentLight.red
    
    private func opacityActiveOn() {
        nameTap = "Next"
        
        switch currentLight {
        case .red:
            circleGreen.activeOpacity = false
            circleRed.activeOpacity = true
            currentLight = .yellow
        case .yellow:
            circleRed.activeOpacity = false
            circleYellow.activeOpacity = true
            currentLight = .green
        case .green:
            circleYellow.activeOpacity = false
            circleGreen.activeOpacity = true
            currentLight = .red
        }
    }
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                circleRed
                    .padding(.top)
                circleYellow
                    .padding(.top)
                circleGreen
                    .padding(.top)
                Spacer()
                Button {
                    opacityActiveOn()
                } label: {
                    Text(nameTap)
                        .font(.title)
                        .fontWeight(.semibold)
                }
                .frame(width: 250, height: 50)
                .background(Color.blue)
                .cornerRadius(15)
                .overlay(RoundedRectangle(cornerRadius: 15).stroke(Color.white,lineWidth: 3))
                .foregroundColor(.white)
                .padding()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}


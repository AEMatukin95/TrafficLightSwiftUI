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
    private var circleRed = CircleView(color: .red)
    private var circleYellow = CircleView(color: .yellow)
    private var circleGreen = CircleView(color: .green)

    private let opacityOn = 1.0
    private let opacityOff = 0.3
    
    @State private var currentLight = CurrentLight.red
    
    private func opacityActiveOn() {
        switch currentLight {
        case .red:
            circleGreen.opacity(opacityOff)
            circleRed.opacity(opacityOn)
            currentLight = .yellow
        case .yellow:
            circleRed.opacity(opacityOff)
            circleYellow.opacity(opacityOn)
            currentLight = .green
        case .green:
            circleYellow.opacity(opacityOff)
            circleGreen.opacity(opacityOn)
            currentLight = .red
        }
    }
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack {
                circleRed
                    .opacity(opacityOff)
                    .padding(.top)
                circleYellow
                    .opacity(opacityOff)
                    .padding(.top)
                circleGreen
                    .opacity(opacityOff)
                    .padding(.top)
                Spacer()
                Button(action: {
                    self.opacityActiveOn()
                }, label: {
                    Text("Start")
                        .font(.title)
                        .fontWeight(.semibold)
                        
                })
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .foregroundColor(.white)
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


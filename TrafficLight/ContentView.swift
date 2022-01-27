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
    @State private var buttonTitle = "Start"
    @State private var currentLight = CurrentLight.red
    
    @State var redLight = 0.3
    @State var yellowLight = 0.3
    @State var greenLight = 0.3
    
    private func opacityActive() {
        let opacityOn = 1.0
        let opacityOff = 0.3
        
        switch currentLight {
        case .red:
            redLight = opacityOn
            greenLight = opacityOff
            currentLight = .yellow
        case .yellow:
            yellowLight = opacityOn
            redLight = opacityOff
            currentLight = .green
        case .green:
            greenLight = opacityOn
            yellowLight = opacityOff
            currentLight = .red
        }
    }
}

extension ContentView {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            VStack(spacing: 20) {
                CircleView(color: .red, activeOpacity: redLight)
                CircleView(color: .yellow, activeOpacity: yellowLight)
                CircleView(color: .green, activeOpacity: greenLight)
                  
                Spacer()
                
                ColorButtonView(title: buttonTitle) {
                    if buttonTitle == "Start" {
                        buttonTitle = "Next"
                    }
                    opacityActive()
                }
            }
            .padding()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}




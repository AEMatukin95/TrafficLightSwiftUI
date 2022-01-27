//
//  ColorButtonView.swift
//  TrafficLight
//
//  Created by Александр Матукин on 27.01.2022.
//

import SwiftUI

struct ColorButtonView: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        
        Button (action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
        }
        .frame(width: 200, height: 60)
        .background(Color.blue)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 4)
        )
    }
}

struct ColorButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ColorButtonView(title: "Start", action: {})
    }
}


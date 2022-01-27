//
//  CircleView.swift
//  TrafficLight
//
//  Created by Александр Матукин on 21.01.2022.
//

import SwiftUI

struct CircleView: View {
    let color: Color
    var activeOpacity: Double
    
    var body: some View {
        Circle()
            .frame(width: 100, height: 100)
            .foregroundColor(color)
            .opacity(activeOpacity)
            .overlay(Circle().stroke(Color.white,lineWidth: 4))
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(color: .red, activeOpacity: 1)
    }
}

//
//  CircleView.swift
//  TrafficLight
//
//  Created by Александр Матукин on 21.01.2022.
//

import SwiftUI

struct CircleView: View {
    let color: Color
    @State var activeOpacity: Bool
    
    var body: some View {
        Circle()
            .foregroundColor(color)
            .frame(width: 100, height: 100)
            .overlay(Circle().stroke(Color.white,lineWidth: 3))
            .opacity(activeOpacity ? 1 : 0.3)
    }
}

struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        CircleView(color: .red, activeOpacity: true)
    }
}

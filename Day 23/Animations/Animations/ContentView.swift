//
//  ContentView.swift
//  Animations
//
//  Created by Victor Cordero Utrilla on 4/29/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount: CGFloat = 1
    @State private var rotationAnimationAmount = 0.0
    
    var body: some View {
        VStack {
            Stepper("Scale Amount", value: $animationAmount.animation(
                Animation.easeOut(duration: 1)
                .repeatCount(3, autoreverses: true)
            ), in: 1...10)
            
            Spacer()
            
            Button("Tap Me") {
                self.animationAmount += 1
            }
            .padding(40)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
            
            Button("Tap Me Too") {
                withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                    self.rotationAnimationAmount += 360
                }
            }
            .padding(40)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .rotation3DEffect(.degrees(rotationAnimationAmount), axis: (x: 0, y: 1, z: 0))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

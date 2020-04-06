//
//  CircularActivityIndicator.swift
//  ProgressBar
//
//  Created by Victor Cordero Utrilla on 4/5/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct CircularActivityIndicator: View {
    
    @State private var spinCircle = false
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0.5, to: 1)
                .stroke(Color(#colorLiteral(red: 0, green: 0.681183815, blue: 0.741138339, alpha: 1)), lineWidth: 4)
                .frame(width: 100)
                .rotationEffect(.degrees(spinCircle ? 0 : -360), anchor: .center)
                .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false))
        }
        .onAppear {
            self.spinCircle = true
        }
    }
}

struct CircularActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        CircularActivityIndicator()
    }
}

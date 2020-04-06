//
//  CircularProgressBar.swift
//  ProgressBar
//
//  Created by Victor Cordero Utrilla on 4/5/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct CircularProgressBar: View {
    
    let value: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: value)
                .stroke(Color(#colorLiteral(red: 0.5886280537, green: 0.9942176938, blue: 1, alpha: 1)), lineWidth: 5)
                .frame(width: 100)
                .rotationEffect(Angle(degrees: -90))
            
            Text(value.getPercentage())
        }
    }
}

struct CircularProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressBar(value: 20)
    }
}

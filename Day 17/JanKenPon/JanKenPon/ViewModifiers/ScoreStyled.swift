//
//  ScoreStyled.swift
//  JanKenPon
//
//  Created by Victor Cordero Utrilla on 4/19/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct ScoreStyled: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.title)
            .foregroundColor(.white)
            .padding(.all, 10)
            .background(Color(#colorLiteral(red: 0.1803921569, green: 0.8, blue: 0.4431372549, alpha: 1)))
            .cornerRadius(20)
    }
}

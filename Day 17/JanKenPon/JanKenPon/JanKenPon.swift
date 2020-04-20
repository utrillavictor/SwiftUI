//
//  JanKenPon.swift
//  JanKenPon
//
//  Created by Victor Cordero Utrilla on 4/19/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct JanKenPon: View {
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    var body: some View {
        Image(name)
            .renderingMode(.original)
            .padding(.all, 20)
            .background(Color.white.opacity(0.8))
            .cornerRadius(40)
            .overlay(Capsule()
                .stroke(Color(#colorLiteral(red: 0, green: 0.6039215686, blue: 0.2666666667, alpha: 1)), lineWidth: 1)
                .shadow(color: .white, radius: 2)
                
        )
    }
}

struct JanKenPon_Previews: PreviewProvider {
    static var previews: some View {
        JanKenPon("paper")
    }
}

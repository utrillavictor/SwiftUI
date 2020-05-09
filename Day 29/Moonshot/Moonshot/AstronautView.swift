//
//  AstronautView.swift
//  Moonshot
//
//  Created by Victor Cordero Utrilla on 5/8/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    
                    Text(self.astronaut.description)
                        .foregroundColor(.primary)
                        .padding()
                        .layoutPriority(1)
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astrounauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        Group {
            AstronautView(astronaut: astrounauts[1])
                .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
            AstronautView(astronaut: astrounauts[1])
                .environment(\.colorScheme, .dark)
            NavigationView {
                AstronautView(astronaut: astrounauts[1])
            }
        }
    }
}

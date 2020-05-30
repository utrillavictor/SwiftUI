//
//  ContentView.swift
//  LeagueOLPedia
//
//  Created by Victor Cordero Utrilla on 5/28/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct Player: Identifiable {
    var id = UUID()
    var powers: [CGFloat]
    var image: String
    var name: String
    var color: Color
}

var data = [
    Player(powers: [0.2, 0.5, 0.9], image: "player1", name: "Mario", color: Color("Color")),
    Player(powers: [0.3, 0.6, 0.5], image: "player2", name: "Luigi", color: Color("Color1")),
    Player(powers: [0.5, 0.4, 0.8], image: "player3", name: "Yoshi", color: Color("Color2")),
]

struct ContentView: View {
    var body: some View {
        NavigationView {
            Home()
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

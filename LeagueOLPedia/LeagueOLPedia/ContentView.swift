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
    var lore: String
}

var data = [
    Player(powers: [0.2, 0.5, 0.9], image: "player1", name: "Riven", color: Color("Color"), lore: "Built on perpetual conflict, Noxus has never had a shortage of war orphans. Her father lost to an unnamed battle and her mother to the girl’s own stubborn birth, Riven was raised on a farm run by the empire on the rocky hillsides of Trevale."),
    Player(powers: [0.5, 0.4, 0.8], image: "player3", name: "Ezreal", color: Color("Color2"), lore: "Born and raised in a wealthy neighborhood of Piltover, Ezreal was always a curious child. His parents were renowned archaeologists, so he became used to their long absences from the family home, often fantasizing about joining them on their travels."),
    Player(powers: [0.3, 0.6, 0.5], image: "player2", name: "Annie", color: Color("Color1"), lore: "Believing most city adults to be like her stepmother, Annie has kept to the wilder parts of her frontier homeland. On occasion, she will use her disarmingly adorable exterior to be taken in by some pioneer family long enough to be offered new clothes and a hot meal. However, fire and death awaits anyone foolish enough to try parting Annie from the stuffed bear at her side.")
]

class Host: UIHostingController<ContentView> {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
}

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

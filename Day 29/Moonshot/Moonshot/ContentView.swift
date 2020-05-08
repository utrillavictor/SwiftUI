//
//  ContentView.swift
//  Moonshot
//
//  Created by Victor Cordero Utrilla on 5/6/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let mission: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationView {
            List(mission) { mission in
                NavigationLink(destination: Text("Detail View")) {
                    
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        
                        Text(mission.formattedLaunchDate)
                    }
                    
                    Spacer()
                }
            }
            .navigationBarTitle("Moonshot", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

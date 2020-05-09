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
    @State private var toggleList = false
    
    var body: some View {
        NavigationView {
            List(mission) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) {
                    
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        
                        if self.toggleList {
                            ForEach(mission.crew, id: \.role) { crew in
                                Text(crew.name)
                            }
                        } else {
                            Text(mission.formattedLaunchDate)
                        }
                    }
                    
                    Spacer()
                }
            }
            .navigationBarTitle("Moonshot", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    self.toggleList.toggle()
                }) {
                    Image(systemName: "line.horizontal.3.decrease.circle")
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

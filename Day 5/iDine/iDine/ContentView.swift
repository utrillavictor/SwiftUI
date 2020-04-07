//
//  ContentView.swift
//  iDine
//
//  Created by Victor Cordero Utrilla on 04/06/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        NavigationView {
            List {
                ForEach(menu, id: \.id) { section in
                    Section(header: Text(section.name)) {
                        ForEach(section.items, id: \.id) { item in
                            ItemRow(item: item)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Menu"))
            .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

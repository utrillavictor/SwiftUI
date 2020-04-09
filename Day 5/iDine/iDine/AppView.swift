//
//  AppView.swift
//  iDine
//
//  Created by Victor Cordero Utrilla on 4/7/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Image(systemName: "list-dash")
                    Text("Menu")
                }
            
            OrderView()
                .tabItem {
                    Image(systemName: "square-and-pencil")
                    Text("Order")
                }
            
            FavoriteView()
                .tabItem {
                    Image(systemName: "favorite")
                    Text("Favorite")
                }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        AppView().environmentObject(order)
    }
}

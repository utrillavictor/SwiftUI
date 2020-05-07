//
//  ContentView.swift
//  Moonshot
//
//  Created by Victor Cordero Utrilla on 5/6/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(0..<100) { row in
                NavigationLink(destination: Text("Detail Row \(row)")) {
                    GeometryReader { geo in
                        Image("MHA")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geo.size.width)
                    }
                    
                    Text("Row \(row)")
                    
                    Spacer()
                }
                
            }
            .navigationBarTitle("SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

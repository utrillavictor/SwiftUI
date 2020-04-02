//
//  ContentView.swift
//  ColorPicker
//
//  Created by Victor Cordero Utrilla on 4/2/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentColor: Color = .clear
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            currentColor
            
            ColorPickerView(chosenColor: $currentColor)
                .frame(width: 50, height: 200)
                .offset(x: 0, y: 75)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

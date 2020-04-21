//
//  ContentView.swift
//  BetterRest
//
//  Created by Victor Cordero Utrilla on 4/20/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date()
    @State private var sleepAmount = 8.0
    
    let components = Calendar.current.dateComponents([.hour, .minute], from: Date())
    var hours: Int {
        components.hour ?? 0
    }
    var minutes: Int {
        components.minute ?? 0
    }
    
    var body: some View {
        Form {
            DatePicker("Enter date", selection: $wakeUp)
            
            Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                Text("\(sleepAmount, specifier: "%g") hours")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

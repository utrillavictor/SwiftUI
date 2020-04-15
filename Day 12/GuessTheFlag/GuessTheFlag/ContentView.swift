//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Victor Cordero Utrilla on 4/14/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showAlert = false
    
    var body: some View {
        Button(action: {
            self.showAlert = true
        }) {
            HStack {
                Image(systemName: "pencil").renderingMode(.original)
                Text("Edit")
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Hello SwiftUI"), message: Text("Showing some detail"), dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  WeSplit
//
//  Created by Victor Cordero Utrilla on 4/9/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = 0
    
    var body: some View {
        NavigationView {
            Form {
                Picker("Select your student", selection: $selectedStudent) {
                    ForEach(0..<students.count) {
                        Text("\(self.students[$0])")
                    }
                }
            }
            .navigationBarTitle("We Split", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

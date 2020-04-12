//
//  ContentView.swift
//  WeSplit
//
//  Created by Victor Cordero Utrilla on 4/9/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = "2"
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    TextField("Number Of People:", text: $numberOfPeople)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Amount per person")) {
                    Text("$\(grandTotal(perPerson: true), specifier: "%.2f")")
                }
                
                Section(header:
                    Text("Total Amount")
                        .font(.title)
                ) {
                    Text("$\(grandTotal(perPerson: false), specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
    
    func grandTotal(perPerson: Bool) -> Double {
        let count = Double(numberOfPeople) ?? 1
        let numberOfPeople = count >= 1 ? count : 1
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let total = orderAmount + tipValue
        return perPerson ? (total / numberOfPeople) : total
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

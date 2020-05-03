//
//  ContentView.swift
//  iExpense
//
//  Created by Victor Cordero Utrilla on 5/3/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

class User: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct SecondView: View {
    var name: String
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text(name)
            Button("Dismiss") {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct ContentView: View {
    @ObservedObject private var user = User()
    @State private var showingSheet = false
    @State private var numbers = [Int]()
    @State private var currentNumber = 1
    
    var body: some View {
        VStack {
            Text("Name is : \(user.firstName) \(user.lastName)")
            TextField("Firstname", text: $user.firstName)
            TextField("Lastname", text: $user.lastName)
            
            List {
                ForEach(numbers, id: \.self) {
                    Text("\($0)")
                }
                .onDelete(perform: removeRows)
                
                Button("Add Number") {
                    self.numbers.append(self.currentNumber)
                    self.currentNumber += 1
                }
            }
            
            Button("Tap me") {
                self.showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                SecondView(name: "@code4mobile")
            }
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        numbers.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

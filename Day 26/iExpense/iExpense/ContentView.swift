//
//  ContentView.swift
//  iExpense
//
//  Created by Victor Cordero Utrilla on 5/3/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items) { item in
                    HStack {
                        self.amountIndicator(item.amount)
                        
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            
                            Text(item.type)
                        }
                        
                        Spacer()
                        
                        Text("$\(item.amount)")
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("iExpense")
            .navigationBarItems(trailing:
                HStack {
                    EditButton()
                        .padding(.trailing, 16)
                    
                    Button(action: {
                        self.showingAddExpense = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            )
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: self.expenses)
            }
        }
    }
    
    func amountIndicator(_ amount: Int) -> AnyView {
        switch amount {
        case 0..<10:
            return AnyView(Rectangle().fill(Color.green).frame(width: 8, height: 44, alignment: .leading))
        case 10..<100:
            return AnyView(Rectangle().fill(Color.yellow).frame(width: 8, height: 44, alignment: .leading))
        default:
            return AnyView(Rectangle().fill(Color.red).frame(width: 8, height: 44, alignment: .leading))
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

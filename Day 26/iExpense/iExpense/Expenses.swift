//
//  Expenses.swift
//  iExpense
//
//  Created by Victor Cordero Utrilla on 5/4/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import Foundation

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let items = UserDefaults.standard.data(forKey: "Items") {
            let decoder = JSONDecoder()
            if let decodedItems = try? decoder.decode([ExpenseItem].self, from: items) {
                self.items = decodedItems
                return
            }
        }
        
        self.items = []
    }
}

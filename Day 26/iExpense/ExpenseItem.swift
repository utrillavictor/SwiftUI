//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Victor Cordero Utrilla on 5/4/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}

//
//  OrderView.swift
//  iDine
//
//  Created by Victor Cordero Utrilla on 4/7/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$ \(item.price)")
                        }
                    }
                }
                
                Section {
                    NavigationLink(destination: Text("Check out")) {
                        Text("Place Order")
                    }
                }
            }
            .navigationBarTitle(Text("Order"))
            .listStyle(GroupedListStyle())
        }
    }
}

struct OrderView_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        OrderView().environmentObject(order)
    }
}

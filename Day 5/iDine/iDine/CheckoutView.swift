//
//  CheckoutView.swift
//  iDine
//
//  Created by Victor Cordero Utrilla on 4/8/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    @State private var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 1
    @State private var showingPaymentAlert = false
    @State private var pickup = 0
    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }
    
    static let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    static let tipAmounts = [15, 10, 20, 25, 0]
    static let pickupTimes = ["Now", "Tonight", "Tomorrow Morning"]
    
    var body: some View {
        Form {
            Section {
                Picker(selection: $paymentType, label: Text("How do you want to pay?")) {
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
                
                Toggle(isOn: $addLoyaltyDetails.animation()) {
                    Text("Add iDine loyalty card")
                }
                
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
            }
            
            Section(header: Text("Add a tip?")) {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(0 ..< Self.tipAmounts.count) {
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("Pickup Time")) {
                Picker("", selection: $pickup) {
                    ForEach(0 ..< Self.pickupTimes.count) {
                        Text("\(Self.pickupTimes[$0])")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header:
                Text("TOTAL: $\(totalPrice, specifier: "%2.f")")
                    .font(.largeTitle)
            ) {
                Button("Confirm order") {
                    self.showingPaymentAlert.toggle()
                }
            }
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Order confirmed"), message: Text("Your total was $\(totalPrice, specifier: "%2.f") - Thank you!"), dismissButton: .default(Text("OK")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}

//
//  ContentView.swift
//  SlotsApp
//
//  Created by Victor Cordero Utrilla on 3/30/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var symbols = ["apple", "donut", "lemon"]
    @State private var numbers = Array(repeating: 0, count: 9)
    @State private var backgrounds = Array(repeating: Color.white, count: 9)
    @State private var credits = 1000
    @State private var betAmount = 5
    @State private var status = ""
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                HStack {
                    Image(systemName: "star.circle.fill")
                        .foregroundColor(.white)
                    Text("iSlots")
                        .bold()
                        .foregroundColor(.white)
                    Image(systemName: "star.circle.fill")
                        .foregroundColor(.white)
                }
                .scaleEffect(2)
                
                Spacer()
                
                Text("Credits: \(credits)")
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                
                Spacer()
                
                Text(status)
                    .bold()
                    .foregroundColor(.pink)
                    .font(.title)
                
                VStack {
                    HStack {
                        Spacer()
                        SlotView(symbol: $symbols[numbers[0]], background: $backgrounds[0])
                        SlotView(symbol: $symbols[numbers[1]], background: $backgrounds[1])
                        SlotView(symbol: $symbols[numbers[2]], background: $backgrounds[2])
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        SlotView(symbol: $symbols[numbers[3]], background: $backgrounds[3])
                        SlotView(symbol: $symbols[numbers[4]], background: $backgrounds[4])
                        SlotView(symbol: $symbols[numbers[5]], background: $backgrounds[5])
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        SlotView(symbol: $symbols[numbers[6]], background: $backgrounds[6])
                        SlotView(symbol: $symbols[numbers[7]], background: $backgrounds[7])
                        SlotView(symbol: $symbols[numbers[8]], background: $backgrounds[8])
                        Spacer()
                    }
                }
                
                Spacer()
                
                HStack {
                    VStack {
                        Button (action: {
                            self.checkBet()
                        }) {
                            Text("Spin")
                                .bold()
                                .foregroundColor(.white)
                                .padding(.all, 10)
                                .padding([.leading, .trailing], 30)
                                .background(Color.pink)
                                .cornerRadius(20)
                            
                        }
                        Text("\(betAmount) Credits")
                            .padding(.top, 10)
                            .font(.footnote)
                    }
                    
                    VStack {
                        Button (action: {
                            self.checkBet(true)
                        }) {
                            Text("Max Spin")
                                .bold()
                                .foregroundColor(.white)
                                .padding(.all, 10)
                                .padding([.leading, .trailing], 30)
                                .background(Color.blue)
                                .cornerRadius(20)
                            
                        }
                        Text("\(betAmount * 5) Credits")
                            .padding(.top, 10)
                            .font(.footnote)
                    }
                }
                
                Spacer()
            }
        }
    }
    
    func checkBet(_ isMax: Bool = false) {
        // Set border back to white
        self.backgrounds = self.backgrounds.map { _ in
            Color.white
        }
        
        if isMax {
            self.numbers = self.numbers.map { _ in
                Int.random(in: 0...self.symbols.count-1)
            }
        } else {
            self.numbers[3] = Int.random(in: 0...self.symbols.count-1)
            self.numbers[4] = Int.random(in: 0...self.symbols.count-1)
            self.numbers[5] = Int.random(in: 0...self.symbols.count-1)
        }
        
        processWin(isMax)
    }
    
    func processWin(_ isMax: Bool = false) {
        var matches = 0
        if isMax {
            // Top row
            if isMatch(0, 1, 2) { matches += 1 }
            // Center row
            if isMatch(3, 4, 5) { matches += 1 }
            // Top Left to Bottom Right
            if isMatch(0, 4, 8) { matches += 1 }
            // Top Right to Bottom Left
            if isMatch(2, 4, 6) { matches += 1 }
            // Bottom row
            if isMatch(6, 7, 8) { matches += 1 }
        } else {
            if isMatch(3, 4, 5) { matches += 1 }
        }
        
        if matches > 0 {
            self.credits += matches * betAmount * 2
        } else if isMax {
            self.credits -= betAmount * 5
        } else {
            self.credits -= betAmount
        }
        
        self.status = matches > 0 ? "Winner" : ""
    }
    
    func isMatch(_ idx1: Int, _ idx2: Int, _ idx3: Int) -> Bool {
        if self.numbers[idx1] == self.numbers[idx2] &&
            self.numbers[idx2] == self.numbers[idx3] {
            
            self.backgrounds[idx1] = Color.green
            self.backgrounds[idx2] = Color.green
            self.backgrounds[idx3] = Color.green
            
            return true
        }
        
        return false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Victor Cordero Utrilla on 4/14/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var message = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                        .foregroundColor(.white)
                    Text(countries[correctAnswer])
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                
                ForEach(0 ..< 3) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.black, lineWidth: 3))
                            .shadow(color: .black, radius: 2)
                    }
                }
                
                Text("Your score is \(score)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .fontWeight(.bold)
                
                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text(message), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
                })
        }
    }
    
    func flagTapped(_ number: Int) {
        scoreTitle = number == correctAnswer ? "Correct" : "Wrong"
        if number == correctAnswer {
            score += 1
        } else {
            score = score <= 0 ? 0 : score - 1
        }
        message = number == correctAnswer ? "" : "That's the flag of \(countries[number])"
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

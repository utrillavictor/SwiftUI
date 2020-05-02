//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Victor Cordero Utrilla on 4/14/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct FlagImage: View {
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    var body: some View {
        Image(name)
            .renderingMode(.original)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.black, lineWidth: 3))
            .shadow(color: .black, radius: 2)
    }
}

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var message = ""
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var flagsAngle = Array(repeating: 0.0, count: 3)
    @State private var flagsOpacity = Array(repeating: 1.0, count: 3)
    @State private var flagsBlur: [CGFloat] = Array(repeating: 0, count: 3)
    
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
                        FlagImage(self.countries[number])
                    }
                    .rotation3DEffect(.degrees(self.flagsAngle[number]), axis: (x: 0, y: 1, z: 0))
                    .opacity(self.flagsOpacity[number])
                    .blur(radius: self.flagsBlur[number])
                    .animation(.default)
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
            isCorrectAnswer(true)
        } else {
            score = score <= 0 ? 0 : score - 1
            isCorrectAnswer(false)
        }
        message = number == correctAnswer ? "" : "That's the flag of \(countries[number])"
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        flagsAngle = Array(repeating: 0.0, count: 3)
        flagsOpacity = Array(repeating: 1.0, count: 3)
        flagsBlur = Array(repeating: 0, count: 3)
    }
    
    func isCorrectAnswer(_ isIt: Bool) {
        for flag in 0...2 {
            if isIt {
                if flag == correctAnswer {
                    flagsAngle[flag] = 360
                } else {
                    flagsOpacity[flag] = 0.25
                }
            } else {
                flagsBlur[flag] = 5
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

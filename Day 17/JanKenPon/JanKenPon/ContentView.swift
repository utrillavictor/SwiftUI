//
//  ContentView.swift
//  JanKenPon
//
//  Created by Victor Cordero Utrilla on 4/19/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var score = 0
    @State private var appChoice = 0
    @State private var attempts = 10
    @State private var userShouldWin = Bool.random()
    @State private var showScore = false
    @State private var scoreTitle = ""
    @State private var message = ""
    
    let options = ["Rock", "Paper", "Scissors"]
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.431372549, green: 1, blue: 0.6274509804, alpha: 1))]), startPoint: .top, endPoint: .bottom)
            
            VStack(spacing: 40) {
                
                Text("Attempts: \(attempts)")
                
                Text("Score: \(score)")
                    .scoreStyled()
                
                HStack(spacing: 20) {
                    ForEach(0 ..< options.count, id: \.self) { (option) in
                        Button(action: {
                            self.evaluate(decision: option)
                        }) {
                            JanKenPon(self.options[option].lowercased())
                        }
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .alert(isPresented: $showScore) {
            Alert(title: Text(scoreTitle), message: Text(message), dismissButton: .default(Text("Continue")) {
                self.continueGame()
                }
            )
        }
    }
    
    func evaluate(decision: Int) {
        guard attempts > 0 else {
            scoreTitle = "Game ended"
            message = "Starting new game..."
            showScore = true
            return
        }
        
        switch decision {
        case 0: appChoice = userShouldWin ? 2 : 1
        case 1: appChoice = userShouldWin ? 0 : 2
        case 2: appChoice = userShouldWin ? 1 : 0
        default: break
        }
        if userShouldWin {
            scoreTitle = "You Win"
            message = "Computer chose: \(options[appChoice]) \n \(options[decision]) beats \(options[appChoice])"
            score += 1
        } else {
            scoreTitle = "You Lose"
            message = "Computer chose: \(options[appChoice]) \n \(options[appChoice]) beats \(options[decision])"
            score = score <= 0 ? 0 : score - 1
        }
        showScore = true
    }
    
    func continueGame() {
        if attempts > 0 {
            userShouldWin = Bool.random()
            attempts -= 1
        } else {
            attempts = 10
            score = 0
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

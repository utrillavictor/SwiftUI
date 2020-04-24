//
//  ContentView.swift
//  WordScramble
//
//  Created by Victor Cordero Utrilla on 4/23/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let people = ["Finn", "Leia", "Luke", "Rey"
    ]
    var body: some View {
        let word = "Swiftilicious"
        let range = NSRange(location: 0, length: word.utf16.count)
        let checker = UITextChecker()
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        let allGood = misspelledRange.location == NSNotFound
        print("allGood: \(allGood)")
        if let fileContents = Bundle.main.url(forResource: "some-file", withExtension: "txt") {
            if let content = try? String(contentsOf: fileContents) {
                // we'll use the content
                print(content)
            }
        }
        
        return List(people, id: \.self) {
            Text("The force is with: \($0)")
        }
        .listStyle(GroupedListStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

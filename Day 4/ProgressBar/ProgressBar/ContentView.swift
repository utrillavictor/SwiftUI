//
//  ContentView.swift
//  ProgressBar
//
//  Created by Victor Cordero Utrilla on 4/5/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var progressBar: CGFloat = 0
    
    var body: some View {
        VStack {
            Button(action: {
                self.progressBar = 0
                Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (timer) in
                    self.progressBar += 0.1
                    if self.progressBar >= 0.9 {
                        timer.invalidate()
                    }
                }
            }) {
                Text("Load")
                    .bold()
                    .foregroundColor(.white)
                    .padding(.all, 10)
                    .padding([.leading, .trailing], 30)
                    .background(Color.pink)
                    .cornerRadius(20)
            }
            .padding(.top, 50)
            
            ProgressBar(value: progressBar)
            
            CircularProgressBar(value: progressBar)
            
            CircularActivityIndicator()
        }
        .background(Color(#colorLiteral(red: 0.351555407, green: 0.8462856412, blue: 0.9061557651, alpha: 1)))
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

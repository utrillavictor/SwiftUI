//
//  ContentView.swift
//  SpeedMeter
//
//  Created by Victor Cordero Utrilla on 6/1/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var progress: CGFloat = 0
    
    var body: some View {
        VStack {
            Meter(progress: $progress)
            
            HStack(spacing: 25) {
                Button(action: {
                    withAnimation(Animation.default.speed(0.55)) {
                        if self.progress != 100 {
                            self.progress += 10
                        }
                    }
                }) {
                    Text("Update")
                        .padding(.vertical)
                        .frame(width: (UIScreen.main.bounds.width - 50) / 2)
                }
                .background(Capsule().stroke(Color.gray, lineWidth: 2))
                
                Button(action: {
                    withAnimation(Animation.default.speed(0.55)) {
                        self.progress = 0
                    }
                }) {
                    Text("Reset")
                        .padding()
                        .frame(width: (UIScreen.main.bounds.width - 50) / 2)
                }
                .background(Capsule().stroke(Color.gray, lineWidth: 2))
            }
            .padding(.top, 55)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

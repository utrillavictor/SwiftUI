//
//  Card.swift
//  LeagueOLPedia
//
//  Created by Victor Cordero Utrilla on 5/29/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct Card: View {
    var data: Player
    
    var body: some View {
        HStack {
            Image(self.data.image)
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width / 1.9)
            
            Spacer()
            
            VStack(spacing: 20) {
                Spacer(minLength: 0)
                
                Image(systemName: "bolt.fill")
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        ZStack {
                            self.data.color
                            Circle()
                                .stroke(Color.black.opacity(0.1), lineWidth: 5)
                            Circle()
                                .trim(from: 0, to: self.data.powers[0])
                                .stroke(Color.white, lineWidth: 5)
                        }
                        .rotationEffect(Angle(degrees: -90))
                    )
                    .clipShape(Circle())
                
                Image(systemName: "suit.heart.fill")
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        ZStack {
                            self.data.color
                            Circle()
                                .stroke(Color.black.opacity(0.1), lineWidth: 5)
                            Circle()
                                .trim(from: 0, to: self.data.powers[1])
                                .stroke(Color.white, lineWidth: 5)
                        }
                        .rotationEffect(Angle(degrees: -90))
                    )
                    .clipShape(Circle())
                
                Image(systemName: "hammer.fill")
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        ZStack {
                            self.data.color
                            Circle()
                                .stroke(Color.black.opacity(0.1), lineWidth: 5)
                            Circle()
                                .trim(from: 0, to: self.data.powers[2])
                                .stroke(Color.white, lineWidth: 5)
                        }
                        .rotationEffect(Angle(degrees: -90))
                    )
                    .clipShape(Circle())
                
                Spacer(minLength: 0)
                
                NavigationLink(destination: Detail(data: self.data)) {
                    Text("See Details")
                        .font(.caption)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)
                        .background(Capsule().stroke(Color.white, lineWidth: 2))
                }
                .offset(y: -35)
            }
            .padding(.trailing)
        }
        .frame(height: 290)
        .background(
            Color.white.opacity(0.2)
            .cornerRadius(25)
            .rotation3DEffect(Angle(degrees: 18), axis: (x: 0, y: -1, z: 0))
            .padding(.vertical, 30)
            .padding(.trailing, 25)
        )
        .padding(.horizontal)
    }
}

struct Card_Previews: PreviewProvider {
    static var previews: some View {
        Card(data: Player(powers: [0.5, 0.4, 0.1], image: "player2", name: "Yoshi", color: Color("Color2")))
    }
}

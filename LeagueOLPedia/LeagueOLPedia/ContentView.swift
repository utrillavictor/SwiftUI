//
//  ContentView.swift
//  LeagueOLPedia
//
//  Created by Victor Cordero Utrilla on 5/28/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct Player: Identifiable {
    var id = UUID()
    var powers: [CGFloat]
    var image: String
    var name: String
    var color: Color
}

var data = [
    Player(powers: [0.2, 0.5, 0.9], image: "player1", name: "Mario", color: Color("Color")),
    Player(powers: [0.3, 0.6, 0.5], image: "player2", name: "Luigi", color: Color("Color1")),
    Player(powers: [0.5, 0.4, 0.8], image: "player3", name: "Yoshi", color: Color("Color2")),
]

struct Card: View {
    var data: Player
    
    var body: some View {
        HStack {
            Image(self.data.image)
                .resizable()
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
                
                Button(action: {
                    
                }) {
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

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Choose Your Player")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer()
                
                Image(systemName: "line.horizontal.3.decrease")
                    .font(.title)
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
            .padding(.top, 50)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 10) {
                    ForEach(data) { i in
                        Card(data: i)
                    }
                }
            }
            
            Spacer()
        }
        .background(
            LinearGradient(gradient: .init(colors: [Color("Color"),Color("Color1")]), startPoint: .top, endPoint: .bottom)
        )
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

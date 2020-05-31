//
//  Detail.swift
//  LeagueOLPedia
//
//  Created by Victor Cordero Utrilla on 5/29/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct Detail: View {
    var data: Player
    @Environment(\.presentationMode) var present
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Button(action: {
                        self.present.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        print("presentation change")
                    }) {
                        Image(systemName: "circle.grid.2x2.fill")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                }
                
                Text("Overview")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .padding()
            
            Image(self.data.image)
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width - 30, height: UIScreen.main.bounds.height / 2)
                .background(Color.white.opacity(0.2))
                .cornerRadius(30)
            
            Text(self.data.name)
                .fontWeight(.bold)
                .font(.system(size: 50))
                .foregroundColor(.white)
                .padding(.top)
            
            Text(self.data.lore)
                .multilineTextAlignment(.center)
                .foregroundColor(.white)
                .padding(.top)
            
            Spacer()
        }
        .background(LinearGradient(gradient: Gradient(colors: [Color("Color2"), Color("Color3")]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct Detail_Previews: PreviewProvider {
    static var previews: some View {
        Detail(data: Player(powers: [0.5, 0.4, 0.1], image: "player2", name: "Yoshi", color: Color("Color2"), lore: ""))
    }
}

//
//  Home.swift
//  LeagueOLPedia
//
//  Created by Victor Cordero Utrilla on 5/29/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct Home: View {
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
                .padding(.bottom)
            }
        }
        .background(
            LinearGradient(gradient: .init(colors: [Color("Color"),Color("Color1")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
        )
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

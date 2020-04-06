//
//  ProgressBar.swift
//  ProgressBar
//
//  Created by Victor Cordero Utrilla on 4/5/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct ProgressBar: View {
    
    let value: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .trailing) {
                Text("Progress: \(self.value.getPercentage())")
                    .padding()
                
                ZStack(alignment: .leading) {
                    Rectangle()
                        .opacity(0.1)
                    
                    Rectangle()
                        .frame(minWidth: 0, idealWidth: self.getProgressBarWidth(geometry: geometry), maxWidth: self.getProgressBarWidth(geometry: geometry))
                        .opacity(0.5)
                        .background(Color(#colorLiteral(red: 0, green: 0.681183815, blue: 0.741138339, alpha: 1)))
                        .animation(.default)
                }
                .frame(height: 10)
            }
            .frame(height: 10)
        }
    }
    
    func getProgressBarWidth(geometry: GeometryProxy) -> CGFloat {
        let frame = geometry.frame(in: .global)
        return frame.size.width * value
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(value: 40)
    }
}

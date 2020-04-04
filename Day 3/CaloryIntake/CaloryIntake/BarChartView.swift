//
//  BarChartView.swift
//  CaloryIntake
//
//  Created by Victor Cordero Utrilla on 4/3/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct BarChartView: View {
    
    @Binding var label: String
    @Binding var value: Int
    
    init(label: Binding<String>, value: Binding<Int>) {
        self._label = label
        self._value = value
    }
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Capsule()
                    .frame(width: 30, height: 200)
                    .foregroundColor(Color(#colorLiteral(red: 0.1841909885, green: 0.918199122, blue: 0.6688014865, alpha: 1)))
                    .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.white, lineWidth: 2.0)
                    )
                
                Capsule()
                    .frame(width: 30, height: CGFloat(value))
                    .foregroundColor(.white)
            }
            
            Text(label.prefix(2).uppercased())
                .padding(.top, 4)
        }
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView(label: Binding.constant("Mo"), value: Binding.constant(50))
    }
}

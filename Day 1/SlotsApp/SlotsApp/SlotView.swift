//
//  SlotView.swift
//  SlotsApp
//
//  Created by Victor Cordero Utrilla on 4/1/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct SlotView: View {
    
    @Binding var symbol: String
    @Binding var background: Color
    
    var body: some View {
        Image(symbol)
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .background(background.opacity(0.5))
            .cornerRadius(20)
    }
}

struct SlotView_Previews: PreviewProvider {
    static var previews: some View {
        SlotView(symbol: Binding.constant("apple"), background: Binding.constant(Color.red))
    }
}

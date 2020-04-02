//
//  ColorPickerView.swift
//  ColorPicker
//
//  Created by Victor Cordero Utrilla on 4/2/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct ColorPickerView: View {
    
    @Binding var chosenColor: Color
    @State private var dragOffset: CGSize = .zero
    @State private var isDragging: Bool = false
    @State private var startLocation: CGFloat = .zero
    
    private var linearGradientHeight: CGFloat = 200.0
    
    private var circleWidth: CGFloat {
        isDragging ? 35 : 15
    }
    
    private var colors: [Color] = {
        let hueValues = Array(0...359)
        
        return hueValues.map {
            Color(UIColor(hue: CGFloat($0) / 359.0,
                          saturation: 1.0,
                          brightness: 1.0,
                          alpha: 1.0))
        }
    }()
    
    private var currentColor: Color {
        Color(UIColor.init(
            hue: self.normalizeGesture() / linearGradientHeight,
            saturation: 1.0,
            brightness: 1.0,
            alpha: 1.0))
    }
    
    private func normalizeGesture() -> CGFloat {
        let offset = startLocation + dragOffset.height
        let maxY = max(0, offset)
        let minY = min(maxY, linearGradientHeight)
        
        return minY
    }
    
    init(chosenColor: Binding<Color>) {
        self._chosenColor = chosenColor
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            LinearGradient(gradient: Gradient(colors: colors),
                           startPoint: .top,
                           endPoint: .bottom)
                .frame(width: 10, height: linearGradientHeight)
                .cornerRadius(5)
                .shadow(radius: 8)
                .overlay(RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.white, lineWidth: 2.0)
                )
                .gesture(
                    DragGesture()
                        .onChanged { (value) in
                            self.chosenColor = self.currentColor
                            self.dragOffset = value.translation
                            self.isDragging = true
                            self.startLocation = value.startLocation.y
                        }
                        .onEnded { _ in
                            self.isDragging = false
                        }
                )
        
            Circle()
                .foregroundColor(self.currentColor)
                .frame(width: self.circleWidth, height: self.circleWidth, alignment: .center)
                .shadow(radius: 5)
                .overlay(
                    RoundedRectangle(cornerRadius: self.circleWidth/2)
                        .stroke(Color.white, lineWidth: 2.0)
                )
                .offset(x: self.isDragging ? -self.circleWidth : 0.0, y: self.normalizeGesture() - self.circleWidth/2)
                .animation(Animation.spring().speed(2))
        }
    }
}

struct ColorPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerView(chosenColor: Binding.constant(Color.white))
    }
}

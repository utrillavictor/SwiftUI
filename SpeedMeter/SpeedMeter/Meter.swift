//
//  Meter.swift
//  SpeedMeter
//
//  Created by Victor Cordero Utrilla on 6/1/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct Meter: View {
    let colors = [Color("Color"), Color("Color1")]
    @Binding var progress: CGFloat
    
    var body: some View {
        ZStack {
            ZStack {
                Circle()
                    .trim(from: 0, to: 0.5)
                    .stroke(Color.black.opacity(0.08), lineWidth: 55)
                    .frame(width: 280, height: 280)
                
                Circle()
                    .trim(from: 0, to: self.setProgress())
                    .stroke(AngularGradient(gradient: Gradient(colors: colors), center: .center, angle: .init(degrees: 180)), lineWidth: 55)
                    .frame(width: 280, height: 280)
            }
            .rotationEffect(Angle(degrees: 180))
            
            ZStack(alignment: .bottom) {
                self.colors[1]
                    .frame(width: 2, height: 95)
                
                Circle()
                    .fill(self.colors[1])
                    .frame(width: 15, height: 15)
            }
            .offset(y: -35)
            .rotationEffect(Angle(degrees: -90))
            .rotationEffect(Angle(degrees: self.moveArrow()))
        }
        .padding(.bottom, -140)
    }
    
    func setProgress() -> CGFloat {
        let temp = self.progress / 2
        return temp * 0.01
    }
    
    func moveArrow() -> Double {
        let temp = self.progress / 100
        return Double(temp * 180)
    }
}

struct Meter_Previews: PreviewProvider {
    static var previews: some View {
        Meter(progress: Binding.constant(0))
    }
}

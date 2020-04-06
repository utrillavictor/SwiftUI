//
//  CGFloat+Extension.swift
//  ProgressBar
//
//  Created by Victor Cordero Utrilla on 4/5/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import CoreGraphics

extension CGFloat {
    
    func getPercentage() -> String {
        let num = Int(ceil(self * 100))
        return "\(num) %"
    }
}

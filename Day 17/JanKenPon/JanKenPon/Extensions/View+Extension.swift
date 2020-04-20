//
//  View+Extension.swift
//  JanKenPon
//
//  Created by Victor Cordero Utrilla on 4/19/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

extension View {
    
    func scoreStyled() -> some View {
        self.modifier(ScoreStyled())
    }
}

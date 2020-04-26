//
//  User.swift
//  CrossTalk
//
//  Created by Victor Cordero Utrilla on 4/25/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import UIKit

class User {
    static let local = User()
    
    let id = UUID()
    var name: String { UIDevice.current.name }
    
    private init() { }
}

//
//  Message.swift
//  CrossTalk
//
//  Created by Victor Cordero Utrilla on 4/25/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import Foundation

struct Message: Codable, Identifiable {
    let id = UUID()
    let username: String
    let value: String
    let timestamp: String
    
    var isFromLocalUser: Bool { username == User.local.name }
}

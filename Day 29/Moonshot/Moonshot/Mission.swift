//
//  Mission.swift
//  Moonshot
//
//  Created by Victor Cordero Utrilla on 5/7/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.timeStyle = .long
            return formatter.string(from: launchDate)
        } else {
            return "N/A"
        }
    }
    
    func getMissionFlew(by astronaut: String) -> String? {
        let flewOn = crew.first(where: { member in
            member.name == astronaut
        })
        guard flewOn != nil else { return nil }
        return displayName
    }
}

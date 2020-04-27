//
//  Gist.swift
//  GithubGist
//
//  Created by Victor Cordero Utrilla on 4/26/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import Foundation

struct Gist: Identifiable {
    
    var createdAtString: String {
        DateFormatter(dateStyle: .short, timeStyle: .short).string(from: ISO8601DateFormatter().date(from: createdAt)!)
    }
    var updatedAtString: String {
        DateFormatter(dateStyle: .short, timeStyle: .short).string(from: ISO8601DateFormatter().date(from: updatedAt)!)
    }
    
    let id = UUID()
    let htmlURL: URL
    let createdAt: String
    let updatedAt: String
    let gistDescription: String
    let owner: Owner
}

extension Gist: Comparable {
    
    static func <(lhs: Gist, rhs: Gist) -> Bool { lhs.updatedAt < rhs.updatedAt }
}

extension Gist: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case htmlURL = "html_url"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case gistDescription = "description"
        case owner
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let htmlURLString = try container.decode(String.self, forKey: .htmlURL)
        htmlURL = URL(string: htmlURLString)!
        createdAt = try container.decode(String.self, forKey: .createdAt)
        updatedAt = try container.decode(String.self, forKey: .updatedAt)
        gistDescription = try container.decode(String.self, forKey: .gistDescription)
        owner = try container.decode(Owner.self, forKey: .owner)
    }
}

//
//  Owner.swift
//  GithubGist
//
//  Created by Victor Cordero Utrilla on 4/26/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import Foundation


struct Owner: Decodable, Hashable {
    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
    }
    
    let login: String
    let avatarURL: URL?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        login = try container.decode(String.self, forKey: .login)
        let avatarURLString = try container.decode(String.self, forKey: .avatarURL)
        avatarURL = URL(string: avatarURLString)
    }
}

//
//  GistCellViewModel.swift
//  GithubGist
//
//  Created by Victor Cordero Utrilla on 4/26/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI
import Combine

final class GistCellViewModel: ObservableObject {
    @Published var avatarImage = Image(systemName: "person.circle.fill")
    
    let gist: Gist
    lazy var gistDescription = gist.gistDescription.trimmingCharacters(in: .whitespacesAndNewlines)
    lazy var lastUpdatedString = "Last updated " + gist.updatedAt
    lazy var urlString = gist.htmlURL.absoluteString
    var subscriptions = Set<AnyCancellable>()
    
    init(gist: Gist) {
        self.gist = gist
        
        Just(gist)
            .map(\.owner.avatarURL!)
            .flatMap(RemoteImageService.shared.avatarPublisher(for:))
            .map(Image.init)
            .receive(on: DispatchQueue.main)
            .assign(to: \.avatarImage, on: self)
            .store(in: &subscriptions)
    }
}

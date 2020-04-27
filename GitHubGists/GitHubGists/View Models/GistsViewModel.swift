//
//  GistsViewModel.swift
//  GithubGist
//
//  Created by Victor Cordero Utrilla on 4/26/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import Foundation
import Combine

final class GistsViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var gists: [Gist] = []
    
//    private let maxRetries: Int
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
//        self.maxRetries = Int(maxRetries)
        
        $searchText
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .removeDuplicates()
            .flatMap { (searchText: String) -> AnyPublisher<[Gist], Never> in
                self.fetchGists(for: searchText.localizedLowercase)
            }
            .assign(to: \.gists, on: self)
            .store(in: &subscriptions)
    }
    
//    private func fetchGists(for username: String) -> AnyPublisher<[Gist], Never> {
//        Just(username)
////            .handleEvents(receiveOutput: { [weak self] in
////                if $0.count < 3 {
////                    self?.gists = []
////                }
////            })
////            .filter { $0.count > 2 }
//            .tryMap(url(for:))
//            .flatMap(gistsPublisher(for:))
//            .catch { _ in Just([])}
//            .receive(on: DispatchQueue.main)
////            .eraseToAnyPublisher()
//    }
    
    private func fetchGists(for owner: String) -> AnyPublisher<[Gist], Never> {
        guard let url = try? url(for: owner) else {
            return
                Just([])
                    .receive(on: DispatchQueue.main)
                    .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .handleEvents(receiveSubscription: { $0.request(.max(1))})
            .map(\.data)
            .decode(type: [Gist].self, decoder: JSONDecoder())
            .catch { _ in Just([])}
            .map { $0.sorted(by: >)}
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    private func url(for username: String) throws -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.github.com"
        components.path = "/users/\(username)/gists"
        guard let url = components.url else { throw URLError(.badURL) }
        return url
    }
}

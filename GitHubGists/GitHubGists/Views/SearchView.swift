//
//  SearchBar.swift
//  GitHubGists
//
//  Created by Victor Cordero Utrilla on 4/26/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel = GistsViewModel()
    
    var body: some View {
        HStack {
            TextField("search", text: $viewModel.searchText)
                .keyboardType(.default)
            
            HStack {
                Button(action: {
                    self.viewModel.searchText = ""
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.primary)
                        .padding(.horizontal, 5)
                }
            }
            .font(.system(size: 25, weight: .thin, design: .default))
            .accentColor(.accentColor)
        }
        .padding(8)
        .overlay(Capsule().stroke(Color.secondary, lineWidth: 1))
        .padding(.horizontal, 7)
    }
}

//
//  ContentView.swift
//  GitHubGists
//
//  Created by Victor Cordero Utrilla on 4/26/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = GistsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                SearchView(viewModel: viewModel)
                
                List(viewModel.gists) { gist in
                    NavigationLink(destination: SafariView(url: gist.htmlURL)
                        .navigationBarTitle("")
                        .navigationBarHidden(true)
                        .edgesIgnoringSafeArea(.bottom)) {
                            GistView(gist: gist)
                    }
                }
            }
            .navigationBarTitle("Gists: \(viewModel.gists.count == 0 ? "" : "\(viewModel.gists.count)")")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension UIView {
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        UIApplication.shared.windows
            .first { $0.isKeyWindow }?
            .endEditing(true)
    }
}

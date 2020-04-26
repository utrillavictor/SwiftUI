//
//  ToolbarView.swift
//  CrossTalk
//
//  Created by Victor Cordero Utrilla on 4/25/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct ToolbarView: View {
    @EnvironmentObject private var viewModel: ChatViewModel
    @Binding var showActionSheet: Bool
    
    var body: some View {
        HStack {
            Button(action: {
                self.showActionSheet = true
            }) {
                Image(systemName: "square.and.arrow.up")
            }
            .padding(.horizontal, 8)
            
            TextField(viewModel.appState.notConnected ? "Inactive" : "Add Message", text: $viewModel.newMessage)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .disabled(viewModel.appState.notConnected)
            
            Button(action: {
                self.viewModel.clear()
            }) {
                Image(systemName: "xmark.circle")
            }
            .disabled(viewModel.newMessageTextIsEmpty)
            
            Button(action: {
                self.viewModel.send()
            }) {
                Image(systemName: "paperplane")
            }
            .disabled(viewModel.newMessageTextIsEmpty)
            .padding(.horizontal, 8)
        }
    }
}

struct ToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        ToolbarView(showActionSheet: Binding.constant(true))
            .environmentObject(ChatViewModel())
        
    }
}

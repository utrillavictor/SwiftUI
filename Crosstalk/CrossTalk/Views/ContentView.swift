//
//  ContentView.swift
//  CrossTalk
//
//  Created by Victor Cordero Utrilla on 4/25/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI
import MultipeerConnectivity

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @EnvironmentObject private var viewModel: ChatViewModel
    @State private var showActionSheet = false
    
    private let formatter = DateFormatter(dateStyle: .short, timeStyle: .short)
    
    var body: some View {
        NavigationView {
            VStack {
                ChatScrollView()
                    .offset(y: viewModel.keyboardOffset + ChatViewModel.safeAreaInsetBottom)
                
                ToolbarView(showActionSheet: $showActionSheet)
                    .padding()
                    .padding(.bottom, ChatViewModel.safeAreaInsetBottom)
                    .background(colorScheme == .dark ? Color.black : Color.white)
                    .offset(y: viewModel.keyboardOffset + ChatViewModel.safeAreaInsetBottom)
                    .animation(.easeInOut(duration: viewModel.keyboardAnimationDuration))
            }
            .navigationBarTitle(Text(viewModel.appState.rawValue), displayMode: .inline)
        }
        .actionSheet(isPresented: $showActionSheet) {
            ActionSheet(title: Text(viewModel.actionSheetTitle), message: nil, buttons: actionSheetButtons())
        }
    }
    
    private func actionSheetButtons() -> [ActionSheet.Button] {
        var buttons = [ActionSheet.Button]()
        
        switch viewModel.appState {
        case .inactive:
            buttons += [
                .default(Text("Host Chat")) {
                    self.viewModel.startAdvertising()
                },
                .default(Text("Join Chat")) {
                    self.viewModel.startBrowsing()
                }
            ]
        default:
            buttons += [
                .default(Text("Disconnect")) {
                    self.viewModel.disconnect()
                }
            ]
        }
        
        buttons.append(.cancel())
        return buttons
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPhone 11 Pro Max")
                .previewDisplayName("iPhone 11 Pro Max")
            
            ContentView()
                .previewDevice("iPhone SE")
                .previewDisplayName("iPhone SE")
                .environment(\.colorScheme, .dark)
        }
    }
}

//
//  ChatScrollView.swift
//  CrossTalk
//
//  Created by Victor Cordero Utrilla on 4/25/20.
//  Copyright © 2020 Victor Cordero Utrilla. All rights reserved.
//

import SwiftUI

struct ChatScrollView: View {
    @EnvironmentObject private var viewModel: ChatViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(viewModel.messages) { message in
                    MessageView(message: message)
                }
            }
        }
        .animation(.easeInOut)
        .onTapGesture {
            UIApplication.shared.windows
                .first { $0.isKeyWindow }?
                .endEditing(true)
        }
    }
}

struct ChatScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ChatScrollView()
    }
}

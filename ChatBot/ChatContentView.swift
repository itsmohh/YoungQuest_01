//
//  ChatContentView.swift
//  TeamBlue
//
//  Created by Gcode on 8/20/24.
//

import SwiftUI

struct ChatContentView: View {
    @ObservedObject var viewModel = ViewModel()
    var body: some View {
        VStack {
            ScrollView {
                ForEach(viewModel.messages.filter({$0.role != .system}), id: \.id) {
                    message in
                    messageView(message: message)
                }
            }
            HStack {
                TextField("Enter a message...", text: $viewModel.currentInput)
                Button {
                    viewModel.sendMessage()
                } label: {
                    Text("Send")
                }
            }
        }
        .padding()
    }
    func messageView(message: Message) -> some View {
        HStack {
            if message.role == .user { Spacer()}
            Text(message.content)
            if message.role == .assistant { Spacer()}
        }
    }
}

#Preview {
    ChatContentView()
}




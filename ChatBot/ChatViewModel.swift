//
//  ChatViewModel.swift
//  TeamBlue
//
//  Created by Gcode on 8/20/24.
//

import Foundation
extension ContentView {
    class ViewModel: ObservableObject {
        @Published var messages: [Message] = []
        
        @Published var currentInput: String = ""
        
        private let openAiService = OpenAiService()
        func sendMessage()  {
            let newMessage = Message(id: UUID(), role: .user, content: currentInput, creatAt: Date())
            messages.append(newMessage)
            currentInput = ""
            
            Task {
                let response = await openAiService.sendMessage(messages: messages)
                guard let receivedOpenAiMessage = response?.choices.first?.message else {
                    print("Had no received message")
                    return
                }
                let receivedMessage = Message(id: UUID(), role: receivedOpenAiMessage.role, content: receivedOpenAiMessage.content, creatAt: Date())
                await MainActor.run {
                    messages.append(receivedMessage)
                }
            }
        }
    }
}

struct Message: Decodable {
    let id: UUID
    let role: SenderRole
    let content: String
    let creatAt: Date
}

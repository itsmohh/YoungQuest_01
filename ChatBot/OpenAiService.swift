//
//  OpenAiService.swift
//  TeamBlue
//
//  Created by Gcode on 8/20/24.
//

import Foundation
import Alamofire

class OpenAiService {
    private let endpointURL = "https://api.openai.com/v1/chat/completions"
    
    func sendMessage(messages: [Message]) async -> OpenAiChatResponse? {
        let openAiMessages = messages.map { OpenAiChatMessage(role: $0.role, content: $0.content) }
        let body = OpenAiChatBody(model: "gpt-3.5-turbo", messages: openAiMessages)
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(Constants.openAiApiKey)"
        ]
        
        do {
            let dataResponse = try await AF.request(endpointURL, method: .post, parameters: body, encoder: .json, headers: headers).serializingData().value
            
            if let jsonString = String(data: dataResponse, encoding: .utf8) {
                print("Raw JSON response: \(jsonString)")
            }
            
            // Attempt to decode the response
            let response = try JSONDecoder().decode(OpenAiChatResponse.self, from: dataResponse)
            return response
        } catch {
            print("Error occurred while sending message to OpenAI: \(error.localizedDescription)")
            return nil
        }
    }
}

struct OpenAiChatBody: Encodable {
    let model: String
    let messages: [OpenAiChatMessage]
}

struct OpenAiChatMessage: Codable{
    let role: SenderRole
    let content: String
}

enum SenderRole: String, Codable {
    case system
    case user
    case assistant
}

struct OpenAiChatResponse: Decodable {
    let choices: [OpenAiChatChoice]
}

struct OpenAiChatChoice: Decodable {
    let message: OpenAiChatMessage
}


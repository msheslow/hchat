//
//  ChatDetailView.swift
//  hypochat
//
//  Created by msheslow on 10/25/23.
//

// ChatDetailView.swift
import SwiftUI

struct ChatDetailView: View {
    @Binding var chats: [Chat]
    var chat: Chat
    @State private var newMessageText: String = ""
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(chat.messages) { message in
                        MessageView(message: message)
                    }
                }
            }
            
            HStack {
                TextField("Type a message...", text: $newMessageText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: sendMessage) {
                    Text("Send")
                }
            }
            .padding()
        }
        .navigationBarTitle(chat.name, displayMode: .inline)
    }
    
    func sendMessage() {
        guard !newMessageText.isEmpty else { return }
        
        if let index = chats.firstIndex(where: { $0.id == chat.id }) {
            let newMessage = Message(text: newMessageText, isSentByUser: true)
            chats[index].messages.append(newMessage)
            newMessageText = ""
        }
    }
}

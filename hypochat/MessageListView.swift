//
//  MessageListView.swift
//  hypochat
//
//  Created by msheslow on 10/25/23.
//
import Foundation
import SwiftUI

struct MessageListView: View {
    @State private var newMessageText: String = ""
    @State private var messages: [Message] = []
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    ForEach(messages) { message in
                        MessageView(message: message)
                    }
                }
            }
            
            HStack {
                TextField("Type a note...", text: $newMessageText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button(action: sendMessage) {
                    Text("Send")
                }
            }
            .padding()
        }
    }
    
    func sendMessage() {
        let newMessage = Message(text: newMessageText, isSentByUser: true)
        messages.append(newMessage)
        newMessageText = ""
    }
}




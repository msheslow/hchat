//
//  NewChatView.swift
//  hypochat
//
//  Created by msheslow on 10/25/23.
//

// NewChatView.swift
import Foundation
import SwiftUI

struct NewChatView: View {
    @Binding var isPresented: Bool
    @Binding var chats: [Chat]
    @State private var newChatName: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Chat Name", text: $newChatName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button(action: createChat) {
                    Text("Create Chat")
                }
                .disabled(newChatName.isEmpty)
                .padding()
            }
            .navigationBarTitle("New Chat", displayMode: .inline)
            .navigationBarItems(trailing: Button("Cancel") {
                isPresented = false
            })
        }
    }
    
    func createChat() {
        let newChat = Chat(name: newChatName, messages: [])
        chats.append(newChat)
        isPresented = false
    }
}

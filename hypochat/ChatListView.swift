//
//  ChatListView.swift
//  hypochat
//
//  Created by msheslow on 10/25/23.
//

// ChatListView.swift
import Foundation
import SwiftUI

struct ChatListView: View {
    @State private var chats: [Chat] = []
    @State private var isCreatingNewChat: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(chats) { chat in
                    NavigationLink(destination: ChatDetailView(chats: $chats, chat: chat)) {
                        Text(chat.name)
                    }
                }
            }
            .navigationBarTitle("Chats")
            .navigationBarItems(trailing: Button(action: {
                self.isCreatingNewChat = true
            }) {
                Text("New Chat")
            })
            .sheet(isPresented: $isCreatingNewChat) {
                NewChatView(isPresented: $isCreatingNewChat, chats: $chats)
            }
        }
    }
}


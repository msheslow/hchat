//
//  ChatTable.swift
//  hypochat
//
//  Created by msheslow on 10/27/23.
//

// ChatTable.swift
import Foundation
import SQLite

struct ChatTable {
    let table = Table("chats")
    let id = Expression<Int64>("id")
    let name = Expression<String>("name")
}

struct MessageTable {
    let table = Table("messages")
    let id = Expression<Int64>("id")
    let chatId = Expression<Int64>("chat_id")
    let text = Expression<String?>("text")
    let isSentByUser = Expression<Bool>("is_sent_by_user")
}

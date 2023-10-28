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
    let name = Expression<String?>("name")
    
    // Other table related methods...
}

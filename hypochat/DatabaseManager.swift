//
//  DatabaseManager.swift
//  hypochat
//
//  Created by msheslow on 10/27/23.
//

// DatabaseManager.swift

import SQLite
import Foundation

class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private var db: Connection?
    
    private init() {
        // Get the path to the documents directory
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        // Create the path to the SQLite database file
        let dbPath = documentsDirectory.appendingPathComponent("db.sqlite3").path
        
        do {
            // Initialize the database connection
            db = try Connection(dbPath)
        } catch {
            print(error)
            db = nil
        }
    }
    
    // Other database related methods...
}


// Inside DatabaseManager.swift

extension DatabaseManager {
    
    func createTables() throws {
        do {
            try db?.run(ChatTable().table.create(ifNotExists: true) { t in
                t.column(ChatTable().id, primaryKey: .autoincrement)  // Use autoincrement for the id column
                t.column(ChatTable().name)
            })
            try db?.run(MessageTable().table.create(ifNotExists: true) { t in
                t.column(ChatTable().id, primaryKey: .autoincrement)  // Use autoincrement for the id column
                t.column(MessageTable().chatId, references: ChatTable().table, ChatTable().id)
                t.column(MessageTable().text)
                t.column(MessageTable().isSentByUser)
            })
        } catch {
            print(error)
            throw error
        }
    }
    
    // ... other methods for inserting, retrieving, updating, and deleting data
}


// Inside DatabaseManager.swift

extension DatabaseManager {
    
    func getAllChats() -> [Chat] {
        var chats: [Chat] = []
        
        do {
            let query = ChatTable().table
            for chatRow in try db?.prepare(query) ?? AnySequence([]) {
                let id = chatRow[ChatTable().id]
                let name = chatRow[ChatTable().name]
                
                let chat = Chat(id: id, name: name)
                chats.append(chat)
            }
        } catch {
            print("Failed to retrieve chats: \(error)")
        }
        
        return chats
    }
}


// DatabaseManager.swift
extension DatabaseManager {
    func insertChat(name: String) throws -> Int64? {  // Changed return type to Int64?
        let insert = ChatTable().table.insert(ChatTable().name <- name)
        do {
            let rowid = try db?.run(insert)  // rowid will hold the id of the newly inserted chat
            return rowid
        } catch {
            print(error)
            throw error
        }
    }
    // ... other methods ...
}


extension DatabaseManager {
    func createNewChat(name: String) throws -> Chat {
        let insert = ChatTable().table.insert(ChatTable().name <- name)
        do {
            let rowid = try db?.run(insert)
            guard let id = rowid else {
                throw NSError()
            }
            return Chat(id: id, name: name)
        } catch {
            print(error)
            throw error
        }
    }
}


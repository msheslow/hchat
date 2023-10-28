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
                t.column(ChatTable().id, primaryKey: true)
                t.column(ChatTable().name)
            })
        } catch {
            print(error)
            throw error
        }
    }
    
    func insertChat(name: String) throws {
        let insert = ChatTable().table.insert(ChatTable().name <- name)
        do {
            try db?.run(insert)
        } catch {
            print(error)
            throw error
        }
    }
    
    // ... more database operation methods as needed
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


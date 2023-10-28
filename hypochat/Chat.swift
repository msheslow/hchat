//
//  Chat.swift
//  hypochat
//
//  Created by msheslow on 10/25/23.
//
// Chat.swift
import Foundation
import SwiftUI

struct Chat: Identifiable {
    var id: Int64
    var name: String
    var messages: [Message]
    
    init(id: Int64, name: String) {
        self.id = id
        self.name = name
        self.messages = []
    }
}





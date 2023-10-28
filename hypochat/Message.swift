//
//  Message.swift
//  hypochat
//
//  Created by msheslow on 10/25/23.
//

import Foundation

// Message.swift
struct Message: Identifiable {
    var id: Int64
    var text: String
    var isSentByUser: Bool
}


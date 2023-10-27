//
//  Message.swift
//  hypochat
//
//  Created by msheslow on 10/25/23.
//

import Foundation

struct Message: Identifiable {
    var id = UUID()
    var text: String
    var isSentByUser: Bool
}

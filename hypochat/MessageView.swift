//
//  MessageView.swift
//  hypochat
//
//  Created by msheslow on 10/25/23.
//
import Foundation
import SwiftUI

struct MessageView: View {
    var message: Message
    
    var body: some View {
        HStack {
            if message.isSentByUser {
                Spacer()
                Text(message.text)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            } else {
                Text(message.text)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(10)
                Spacer()
            }
        }
        .padding()
    }
}

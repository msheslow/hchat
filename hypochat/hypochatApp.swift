//
//  hypochatApp.swift
//  hypochat
//
//  Created by msheslow on 10/25/23.
//
import Foundation
import SwiftUI

@main
struct hypochatApp: App {

    init() {
        do {
            try DatabaseManager.shared.createTables()
        } catch {
            print("Failed to create tables: \(error)")
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


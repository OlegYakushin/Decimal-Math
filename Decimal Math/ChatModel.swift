//
//  ChatModel.swift
//  Decimal Math
//
//  Created by Oleg Yakushin on 7/2/23.
//

import Foundation
import SwiftUI

struct Message: Identifiable, Codable{
    let id: UUID
    var sender: String
    var timestamp: Date
    var content: String
    init(id: UUID, sender: String, timestamp: Date, content: String) {
        self.id = id
        self.sender = sender
        self.timestamp = timestamp
        self.content = content
    }
}

struct Chat: Identifiable, Codable {
    let id: UUID
    var user: String
    var accentColor: String
    var unreadCount: Int
    var lastMessageDate: Date
    var lastMessageText: String
    var messages: [Message]
    
    init(id: UUID, user: String, accentColor: String, unreadCount: Int, lastMessageDate: Date, lastMessageText: String, messages: [Message]) {
        self.id = id
        self.user = user
        self.accentColor = accentColor
        self.unreadCount = unreadCount
        self.lastMessageDate = lastMessageDate
        self.lastMessageText = lastMessageText
        self.messages = messages
    }
}

extension Chat {
    static var sampleData: [Chat] =
    [  Chat(
        id: UUID(),
        user: "Alice",
        accentColor: "FF0000",
        unreadCount: 2,
        lastMessageDate: Date(),
        lastMessageText: "I'm good, thanks!",
        messages: [
            Message(
                id: UUID(),
                sender: "Alice",
                timestamp: Date(),
                content: "Hi John, how are you?"
            ),
            Message(
                id: UUID(),
                sender: "You",
                timestamp: Date(),
                content: "I'm good, thanks!"
            )
        ]
    ),
    Chat(
        id: UUID(),
        user: "Bob",
        accentColor: "008000",
        unreadCount: 0,
        lastMessageDate: Calendar.current.date(from: DateComponents(year: 2023, month: 2, day: 3))!,
        lastMessageText: "Hey, what's up?",
        messages: [
            Message(
                id: UUID(),
                sender: "You",
                timestamp: Date(),
                content: "Hey, what's up?"
            )]
    ),
    Chat(
        id: UUID(),
        user: "Emily",
        accentColor: "FFD700",
        unreadCount: 1,
        lastMessageDate: Calendar.current.date(from: DateComponents(year: 2023, month: 6, day: 3))!,
        lastMessageText: "See you later!",
        messages: [
            Message(
                id: UUID(),
                sender: "Emily",
                timestamp: Date(),
                content: "Goodbye!"
            ),
            Message(
                id: UUID(),
                sender: "You",
                timestamp: Date(),
                content: "See you later!"
            )
        ]
    ),
    Chat(
        id: UUID(),
        user: "David",
        accentColor: "6A5ACD",
        unreadCount: 0,
        lastMessageDate: Date(),
        lastMessageText: "Have a nice day!",
        messages: [
            Message(
                id: UUID(),
                sender: "You",
                timestamp: Date(),
                content: "Have a nice day!"
            )
        ]
    )
    ]
    
    
    
}



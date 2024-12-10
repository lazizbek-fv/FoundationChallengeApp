//
//  Reminder.swift
//  FoundationChallenge
//
//  Created by Bekhruzjon Hakmirzaev on 10/12/24.
//

import SwiftData
import Foundation

enum Priority: String, Codable, CaseIterable {
    case low
    case medium
    case high
}

@Model
class Reminder {
    @Attribute(.unique) var id: UUID
    var title: String
    var date: Date
    var notes: String
    var isCompleted: Bool
    var priority: Priority

    init(
        title: String,
        date: Date,
        notes: String = "",
        isCompleted: Bool = false,
        priority: Priority = .medium
    ) {
        self.id = UUID()
        self.title = title
        self.date = date
        self.notes = notes
        self.isCompleted = isCompleted
        self.priority = priority
    }
}

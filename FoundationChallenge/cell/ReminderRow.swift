//
//  ReminderRow.swift
//  FoundationChallenge
//
//  Created by Bekhruzjon Hakmirzaev on 10/12/24.
//

import SwiftUI

struct ReminderRow: View {
    var reminder: Reminder
    var body: some View {
        HStack {
            Text(reminder.title)
            Spacer()
            Text(reminder.date.formatted())
        }
    }
}

#Preview {
    ReminderRow(reminder: Reminder(title: "Title", date: Date()))
}

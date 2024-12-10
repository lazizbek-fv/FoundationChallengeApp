//
//  RemainderView.swift
//  FoundationChallenge
//
//  Created by Lazizbek Fayzullayev on 09/12/24.
//

import SwiftUI
import SwiftData

struct RemainderView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Reminder.date, order: .forward) private var reminders: [Reminder]
    
    var body: some View {
        List {
            // Active Reminders Section
            let activeReminders = reminders.filter { !$0.isCompleted }
            if !activeReminders.isEmpty {
                Section("Active Reminders") {
                    ForEach(activeReminders) { reminder in
                        ReminderRow(reminder: reminder)
                    }
                }
            }
            
            // Completed Reminders Section
            let completedReminders = reminders.filter { $0.isCompleted }
            if !completedReminders.isEmpty {
                Section("Completed Reminders") {
                    ForEach(completedReminders) { reminder in
                        ReminderRow(reminder: reminder)
                    }
                }
            }
        }
        .navigationTitle("Reminders")
        .toolbar {
            // Add Button in the Toolbar
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: AddReminderView()) {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

//#Preview {
//    RemainderView()
//}

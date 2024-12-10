//
//  AddReminderView.swift
//  FoundationChallenge
//
//  Created by Bekhruzjon Hakmirzaev on 10/12/24.
//

import SwiftUI
import SwiftData

struct AddReminderView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext

    @State private var title = ""
    @State private var notes = ""
    @State private var date = Date()
    @State private var selectedPriority: Priority = .medium

    var body: some View {
        Form {
            TextField("Title", text: $title)
            TextField("Description", text: $notes)
            DatePicker("Date", selection: $date, displayedComponents: [.date, .hourAndMinute])

            Picker("Priority", selection: $selectedPriority) {
                ForEach(Priority.allCases, id: \.self) { priority in
                    Text(priority.rawValue.capitalized)
                }
            }
            .pickerStyle(SegmentedPickerStyle())

            Button("Save") {
                let newReminder = Reminder(
                    title: title,
                    date: date,
                    notes: notes,
                    priority: selectedPriority
                )
                modelContext.insert(newReminder) // Save to SwiftData
                dismiss() // Close the view
            }
            .disabled(title.isEmpty)
        }
        .navigationTitle("Add Reminder")
    }
}

#Preview {
    AddReminderView()
}

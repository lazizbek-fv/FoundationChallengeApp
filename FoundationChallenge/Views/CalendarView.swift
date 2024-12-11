//
//  CalendarView.swift
//  FoundationChallenge
//
//  Created by Lazizbek Fayzullayev on 09/12/24.
//

import SwiftUI
import SwiftData

struct CalendarView: View {
    
    @State private var selectedDate = Date()
        @Query(sort: \Reminder.date, order: .forward) private var reminders: [Reminder]

    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    // Calendar Picker
                    DatePicker(
                        "Choose a date",
                        selection: $selectedDate,
                        displayedComponents: [.date]
                    )
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding()
                    
                    Divider()
                    
                    // Filtered Reminders for the Selected Date
                    let filteredReminders = reminders.filter {
                        Calendar.current.isDate($0.date, inSameDayAs: selectedDate)
                    }
                    
                    if filteredReminders.isEmpty {
                        Text("No reminders for this day")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                            .padding()
                    } else {
                        ForEach(filteredReminders) { reminder in
                            ReminderRow(reminder: reminder)
                                .padding(.horizontal)
                        }
                    }
                }
            }
            .background(Color(.systemGroupedBackground))
            .navigationTitle("Calendar")
        }
    }
}

#Preview {
    CalendarView()
}


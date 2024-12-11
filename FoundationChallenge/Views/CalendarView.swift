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
                    VStack {
                        DatePicker(
                            "Choose a date",
                            selection: $selectedDate,
                            displayedComponents: [.date]
                        )
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .padding()
                        Spacer()
                        
                        List {
                            ForEach(reminders) { reminder in
                                if reminder.date == selectedDate {
                                    ReminderRow(reminder: reminder)
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


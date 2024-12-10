//
//  CalendarView.swift
//  FoundationChallenge
//
//  Created by Lazizbek Fayzullayev on 09/12/24.
//

import SwiftUI

struct CalendarView: View {
    @State private var selectedDate = Date()
    
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
            }
            
            .navigationTitle("Calendar")
        }
    }
}

#Preview {
    CalendarView()
}

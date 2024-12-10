//
//  MenuView.swift
//  FoundationChallenge
//
//  Created by Lazizbek Fayzullayev on 09/12/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        VStack {
            NavigationStack {
                List {
                    NavigationLink("Reminders", destination: RemainderView())
                    NavigationLink("Meetings", destination: MeetingView())
                    NavigationLink("Tasks", destination: TaskView())
                }
                
                .navigationTitle("Menu")
            }
        }
    }
}

#Preview {
    MenuView()
}

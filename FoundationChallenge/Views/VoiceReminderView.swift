//
//  VoiceRemindersView.swift
//  FoundationChallenge
//
//  Created by Lazizbek Fayzullayev on 10/12/24.
//

import SwiftUI

struct VoiceReminderView: View {
    var body: some View {
        NavigationStack {
            List {
                Text("voice reminder")
            }
            
            .navigationTitle("Voice Reminders")
        }
    }
}

#Preview {
    VoiceReminderView()
}

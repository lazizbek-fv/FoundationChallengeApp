//
//  FoundationChallengeApp.swift
//  FoundationChallenge
//
//  Created by Lazizbek Fayzullayev on 05/12/24.
//

import SwiftUI
import SwiftData

@main
struct FoundationChallengeApp: App {
    var body: some Scene {
        WindowGroup {
            ContainerView()
                .modelContainer(for: Reminder.self)
        }
    }
}

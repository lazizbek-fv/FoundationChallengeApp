//
//  TabBarView.swift
//  FoundationChallenge
//
//  Created by Lazizbek Fayzullayev on 09/12/24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            DashboardView()
                .tabItem {
                    Label("Menu", systemImage: "contextualmenu.and.cursorarrow")
                }

            CalendarView()
                .tabItem {
                    Label("Calender", systemImage: "calendar")
            }
        }
    }
}

#Preview {
    TabBarView()
}

//
//  TabBarView.swift
//  FoundationChallenge
//
//  Created by Lazizbek Fayzullayev on 09/12/24.
//

import SwiftUI

struct ContainerView: View {
    var body: some View {
        TabView {
            MenuView()
                .tabItem {
                    Label("Menu", systemImage: "contextualmenu.and.cursorarrow")
                }
            
            CalendarMainView()
                .tabItem {
                    Label("Calender", systemImage: "calendar")
                }
            
        }
    }
}

#Preview {
    ContainerView()
}

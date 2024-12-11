//
//  MenuView.swift
//  FoundationChallenge
//
//  Created by Lazizbek Fayzullayev on 09/12/24.
//

import SwiftUI
import SwiftData

struct DashboardView: View {
    @State var showAddReminderView: Bool = false
    @Query(sort: \Reminder.date, order: .forward) private var reminders: [Reminder]
    @State var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 15) {
                        DashboardItem(title: "Today", icon: "calendar.badge.exclamationmark", color: .blue, count: 0)
                        DashboardItem(title: "Scheduled", icon: "calendar.badge.clock", color: .red, count: 0)
                        DashboardItem(title: "Flagged", icon: "flag.fill", color: .orange, count: 0)
                        DashboardItem(title: "Completed", icon: "checkmark.circle.fill", color: .gray, count: 0)
                    }
                    .padding(.horizontal)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("My Lists")
                            .font(.headline)
                            .padding(.leading)
                        
                        NavigationLink(destination: RemainderView()) {
                            HStack {
                                Image(systemName: "list.bullet")
                                    .foregroundColor(.orange)
                                Text("Reminders")
                                Spacer()
                                Text("\(reminders.count)")
                                    .foregroundColor(.gray)
                                Image(systemName: "chevron.right")
                            }
                            .padding(10)
                            .overlay(RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.6), lineWidth: 1))
                        }
                        NavigationLink(destination: Text("Voice Reminders")) {
                            HStack {
                                Image(systemName: "mic.fill")
                                    .foregroundColor(.blue)
                                Text("Voice Reminders")
                                Spacer()
                                Text("0")
                                    .foregroundColor(.gray)
                                Image(systemName: "chevron.right")
                            }
                        }
                        .padding(10)
                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.6), lineWidth: 1))
                    }.padding(.horizontal)
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            
            .toolbar {
                ToolbarItem(placement: .bottomBar, content: {
                    HStack {
                        Button(action: {
                            self.showAddReminderView.toggle()
                        }) {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                                Text("New Reminder")
                            }
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.blue)
                        }.sheet(isPresented: $showAddReminderView, content: {
                            AddReminderView()
                        })
                        
                        Spacer()
                        
                        Button(action: {}) {
                            HStack {
                                Image(systemName: "mic.fill")
                                Text("Add Voice Reminder")
                            }
                            .font(.system(size: 16, weight: .medium))
                            .foregroundColor(.blue)
                        }
                    }
                })
            }
        }
    }
}

struct DashboardItem: View {
    let title: String
    let icon: String
    let color: Color
    let count: Int
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(color)
                    .font(.system(size: 30))
                Spacer()
                Text("\(count)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            Spacer()
            
            HStack {
                Text(title)
                    .font(.callout)
                    .foregroundColor(.black)
                
                Spacer()
            }
        }
        .padding()
        .frame(height: 100)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color(.systemGray4), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    DashboardView()
}

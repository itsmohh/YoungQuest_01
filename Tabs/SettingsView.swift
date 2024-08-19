//
//  SettingsView.swift
//  TeamBlue
//
//  Created by Sixty One on 8/6/24.
//

import SwiftUI

struct SettingsView: View {
    // Use @AppStorage to store the dark mode preference
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink(destination: ProfileView()) {
                        HStack {
                            Image(systemName: "person.circle.fill")
                                .foregroundColor(.blue)
                                .font(.system(size: 24))
                            Text("Profile")
                                .font(.headline)
                        }
                    }

                    NavigationLink(destination: ExpensesView(currentTab: .constant("Expenses"))) {
                        HStack {
                            Image("budget")
                                .foregroundColor(.blue)
                                .font(.system(size: 24))
                            Text("Budget Category")
                                .font(.headline)
                        }
                    }
                    
                    NavigationLink(destination: ChangePasswordView()) {
                        HStack {
                            Image(systemName: "lock.fill")
                                .foregroundColor(.red)
                                .font(.system(size: 24))
                            Text("Change Password")
                                .font(.headline)
                        }
                    }
                }
                
                Section(header: Text("Preferences")) {
                    Toggle(isOn: $isDarkMode) {
                        HStack {
                            Image(systemName: "moon.fill")
                                .foregroundColor(.purple)
                                .font(.system(size: 24))
                            Text("Dark Mode")
                                .font(.headline)
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .background(Color(.systemGroupedBackground))
            .preferredColorScheme(isDarkMode ? .dark : .light) // Apply the color scheme based on the toggle state
        }
    }
}

#Preview {
    SettingsView()
}

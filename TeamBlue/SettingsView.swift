//
//  SettingsView.swift
//  TeamBlue
//
//  Created by Sixty One on 8/6/24.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            Form  {
                Section(header: Text("Account Info")) {
                         NavigationLink(destination: ProfileView()) {
                             Text("Profile")
                         }
                    }
                Section(header: Text("Jobs")) {
                        NavigationLink(destination: HomeView()) {
                            Text("Jobs Accepted")
                        }
                    }
                Section(header: Text("Notifications")) {
                          Toggle("Enable Notifications", isOn: .constant(true))
                      }
                Section(header: Text("App Theme")) {
                        NavigationLink(destination: HomeView()) {
                            Text("Change Theme")
                        }
                    }
                Section(header: Text("Help & Support")) {
                          NavigationLink(destination: HomeView()) {
                              Text("Help & Support")
                          }
                      }
                Section {
                          Button(action: {
                              // Add log out functionality here
                              print("User logged out")
                          }) {
                              Text("Log Out")
                                  .foregroundColor(.red)
                          }
                      }
                .navigationTitle("Settings")
            }
        }
                }
                }
#Preview {
            SettingsView()
        }

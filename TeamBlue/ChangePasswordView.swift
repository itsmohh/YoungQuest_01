//
//  ChangePasswordView.swift
//  TeamBlue
//
//  Created by Gcode on 8/12/24.
//


import SwiftUI

struct ChangePasswordView: View {
    @State private var currentPassword: String = ""
    @State private var newPassword: String = ""
    @State private var confirmPassword: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Change Password")) {
                    SecureField("Current Password", text: $currentPassword)
                    SecureField("New Password", text: $newPassword)
                    SecureField("Confirm New Password", text: $confirmPassword)
                }
                
                Button(action: handleChangePassword) {
                    Text("Update Password")
                }
                .disabled(!isPasswordValid)
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Password Change"),
                        message: Text(alertMessage),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
            .navigationTitle("Change Password")
        }
    }
    
    private var isPasswordValid: Bool {
        newPassword == confirmPassword && !newPassword.isEmpty && !currentPassword.isEmpty
    }
    
    private func handleChangePassword() {
        if newPassword != confirmPassword {
            alertMessage = "New passwords do not match."
        } else if newPassword.isEmpty || currentPassword.isEmpty {
            alertMessage = "Please fill in all fields."
        } else {
            // Handle password change logic here
            alertMessage = "Password updated successfully."
        }
        showAlert = true
    }
}

#Preview {
    ChangePasswordView()
}

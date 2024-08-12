import SwiftUI

struct ProfileView: View {
    @State private var username: String = "John Doe"
    @State private var email: String = "johndoe@example.com"
    @State private var profileImage: Image = Image(systemName: "person.crop.circle.fill")

    var body: some View {
        NavigationView {
            VStack {
                profileImage
                    .resizable()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                    .padding(.top, 20)
                    .onTapGesture {
                        // Action to change profile picture
                    }

                Form {
                    Section(header: Text("User Info")) {
                        HStack {
                            Text("Username:")
                            Spacer()
                            TextField("Username", text: $username)
                                .multilineTextAlignment(.trailing)
                        }

                        HStack {
                            Text("Email:")
                            Spacer()
                            TextField("Email", text: $email)
                                .multilineTextAlignment(.trailing)
                                .keyboardType(.emailAddress)
                        }
                    }

                    Section(header: Text("Settings")) {
                        NavigationLink(destination: ChangePasswordView()) {
                            Text("Change Password")
                        }
                    }
                }
                .padding(.top, 10)
            }
            .navigationTitle("Profile")
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    ProfileView()
}

import SwiftUI

struct SignInView: View {
@State private var username: String = ""
@State private var password: String = ""
@State private var showingAlert = false
@State private var alertMessage = ""
@State private var isAuthenticated = false

var body: some View {
    NavigationStack {
        ZStack {
            // Background color
            Color.black
                .ignoresSafeArea() // Ensures the background covers the entire screen
            
            // Gradient rounded rectangle
            RoundedRectangle(cornerSize: CGSize(width: 30, height: 30), style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.black, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: UIScreen.main.bounds.width * 1.5, height: UIScreen.main.bounds.height * 1.5)
                .rotationEffect(.degrees(135))
                .offset(y: -350)
            
            // Content
            VStack(spacing: 20) {
                Text("Welcome")
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                    .offset(x: -5, y: -100)
                
                // Username TextField
                TextField("Username", text: $username)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .autocapitalization(.none)
                    .placeholder(when: username.isEmpty) {
                        Text("Username")
                            .foregroundColor(.white)
                            .bold()
                    }
                
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                
                // Password SecureField
                SecureField("Password", text: $password)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .placeholder(when: password.isEmpty) {
                        Text("Password")
                            .foregroundColor(.white)
                            .bold()
                    }
                
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                
                // Login Button
                Button(action: {
                    loginButtonTapped()
                }) {
                    Text("Login")
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerSize: CGSize(width: 30, height: 30), style: .continuous)
                                .foregroundStyle(.linearGradient(colors: [.blue, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                        )
                }
                .padding(.top)
                .offset(y: 100)
            }
            .frame(width: 350)
        }
        .padding()
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Login"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
        .navigationDestination(isPresented: $isAuthenticated) {
            WelcomeView()
                .navigationBarBackButtonHidden(true)
        }
    }
}

func loginButtonTapped() {
    guard !username.isEmpty && !password.isEmpty else {
        alertMessage = "Please enter both username and password"
        showingAlert = true
        return
    }

    if isValidLogin(username: username, password: password) {
        // If login is successful, set isAuthenticated to true
        isAuthenticated = true
    } else {
        alertMessage = "Invalid username or password"
        showingAlert = true
    }
}

func isValidLogin(username: String, password: String) -> Bool {
    if !isValidEmail(username) {
        alertMessage = "Invalid email format"
        return false
    }

    if !isValidPassword(password) {
        alertMessage = "Password must be at least 8 characters long"
        return false
    }

    // Simulated server-side validation
    let storedUsername = "user@example.com"
    let storedPassword = "password123"

    return username == storedUsername && password == storedPassword
}

func isValidEmail(_ email: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)
}

func isValidPassword(_ password: String) -> Bool {
    return password.count >= 8
}

}

extension View {
func placeholder<Content: View>(
when shouldShow: Bool,
alignment: Alignment = .leading,
@ViewBuilder placeholder: () -> Content) -> some View {

    ZStack(alignment: alignment) {
        placeholder().opacity(shouldShow ? 1 : 0)
        self
    }
}

}

struct SignInView_Previews: PreviewProvider {
static var previews: some View {
SignInView()
}
}

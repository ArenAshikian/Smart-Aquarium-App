import SwiftUI

struct ContentView: View {
    @State private var name: String = ""
    @State private var password: String = ""
    @State private var showPassword: Bool = false
    @State private var logIn: Bool = false
    
    @State private var navigateToPagesView = false
    @State private var navigateToSignUpView = false
    
    var isSignInButtonDisabled: Bool {
        name.isEmpty || password.isEmpty
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 15) {
                Spacer()
                
                TextField("Name",
                          text: $name,
                          prompt: Text("Login").foregroundColor(.blue)
                )
                .padding(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.blue, lineWidth: 2)
                }
                .padding(.horizontal)
                
                HStack {
                    Group {
                        if showPassword {
                            TextField("Password",
                                      text: $password,
                                      prompt: Text("Password").foregroundColor(.red))
                        } else {
                            SecureField("Password",
                                        text: $password,
                                        prompt: Text("Password").foregroundColor(.red))
                        }
                    }
                    .padding(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.red, lineWidth: 2)
                    }
                    
                    Button {
                        showPassword.toggle()
                    } label: {
                        Image(systemName: showPassword ? "eye.slash" : "eye")
                            .foregroundColor(.red)
                    }
                }.padding(.horizontal)
                
                Spacer()
                
                HStack {
                    NavigationLink(
                        destination: Pages_View(),
                        isActive: $navigateToPagesView,
                        label: {
                            EmptyView()
                        }
                    )
                    
                    Button {
                        // Perform login action here
                        print("do login action")
                        
                        // Set navigateToPagesView to true to trigger the navigation
                        navigateToPagesView = true
                    } label: {
                        Text("Sign In")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                    }
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(
                        isSignInButtonDisabled ?
                        LinearGradient(colors: [.gray], startPoint: .topLeading, endPoint: .bottomTrailing) :
                            LinearGradient(colors: [.green, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .cornerRadius(20)
                    .disabled(isSignInButtonDisabled)
                    .padding()
                }
                
                HStack {
                    Text("Don't have an account?")
                        .foregroundColor(.gray)
                    
                    Button(action: {
                        // Navigate to the sign-up page
                        navigateToSignUpView = true
                    }) {
                        Text("Sign Up")
                            .foregroundColor(.blue)
                            .underline()
                    }
                    .sheet(isPresented: $navigateToSignUpView) {
                        // Replace SignUpView() with your actual sign-up view
                        SignUpView()
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct Pages_View: View {
    @State private var selectedTab: Tab = .house
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selectedTab){
                    // Replace the following views with your actual views
                    Text("House View")
                        .tag(Tab.house)
                    Text("Message View")
                        .tag(Tab.message)
                    Text("Person View")
                        .tag(Tab.person)
                    Text("Car View")
                        .tag(Tab.car)
                    Text("Trash View")
                        .tag(Tab.trash)
                }
            }
            VStack {
                Spacer()
                MyTabBar(selectedTab: $selectedTab)
            }
        }
    }
}

struct SignUpView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var isSignUpButtonDisabled: Bool {
        email.isEmpty || password.isEmpty || confirmPassword.isEmpty || password != confirmPassword
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Spacer()
            
            TextField("Email", text: $email)
                .padding(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.blue, lineWidth: 2)
                }
                .padding(.horizontal)
            
            SecureField("Password", text: $password)
                .padding(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.red, lineWidth: 2)
                }
                .padding(.horizontal)
            
            SecureField("Confirm Password", text: $confirmPassword)
                .padding(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.red, lineWidth: 2)
                }
                .padding(.horizontal)
            
            Button(action: {
                // Perform sign-up action here
                print("do sign-up action")
            }) {
                Text("Sign Up")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
            }
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(
                isSignUpButtonDisabled ?
                LinearGradient(colors: [.gray], startPoint: .topLeading, endPoint: .bottomTrailing) :
                    LinearGradient(colors: [.green, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .cornerRadius(20)
            .disabled(isSignUpButtonDisabled)
            .padding()
            
            Spacer()
        }
        .padding()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}

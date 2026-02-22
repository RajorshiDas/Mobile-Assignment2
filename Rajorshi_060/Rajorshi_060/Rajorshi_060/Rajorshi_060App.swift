//
//  Rajorshi_060App.swift
//  Rajorshi_060
//
//  Created by Rajorshi Das on 22/2/26.
//

import SwiftUI
import Firebase

@main
struct Rajorshi_060App: App {
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
    @StateObject private var viewModel = AuthViewModel()

    @State private var email = ""
    @State private var password = ""

    init()
    {
        FirebaseApp.configure()
        print("Configured Firebase!!!")
        
    }
    
    var body: some Scene {
        WindowGroup {
            VStack {
                if viewModel.isSignedIn {
                    ContentView() .environmentObject(viewModel)
                    
                } else {
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    HStack {
                        Button("Sign In") {
                            viewModel.signIn(email: email, password: password)
                        }
                        Button("Sign Up") {
                            viewModel.signUp(email: email, password: password)
                        }
                    }
                }
            }
            .padding()
        }
    }
}

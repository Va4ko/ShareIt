//
//  AuthViewModel.swift
//  ShareIt
//
//  Created by Vachko on 9.07.21.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        
        if Auth.auth().currentUser?.isEmailVerified == true {
            userSession = Auth.auth().currentUser
        }
        
    }
    
    func logIn(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Error with signing in with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            if user.isEmailVerified {
                self.userSession = user
                self.fetchUser()
            } else {
                print("The email is not verified yet!")
            }
        }
    }
    
    func register(withEmail email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let user = result?.user else { return }
            user.sendEmailVerification { error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print("Verification email has been sent")
                }
            }
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut()
        self.userSession = nil
    }
    
    func fetchUser() {
        print("Fetching user list")
    }
}

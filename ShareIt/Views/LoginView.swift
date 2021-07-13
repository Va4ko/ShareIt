//
//  LoginView.swift
//  ShareIt
//
//  Created by Vachko on 6.07.21.
//

import SwiftUI
import Firebase

struct LoginView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isEditing = false
    @State private var showRegistrationView = false
    
    var body: some View {
//        NavigationView {
            ZStack {
                
                VStack {
                    
                    Spacer()
                    
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .padding(.top, 50)
                    
                    VStack(spacing: 20) {
                        
                        Spacer()
                        
                        CustomTextField(text: $email, placeHolder: Text("Email"), imageName: "envelope")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal, 50)
                        
                        CustomSecureField(text: $password, placeHolder: Text("Password"))
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .padding(.horizontal, 50)
                        
                    }
                    
                    HStack {
                        //                        Spacer()
                        
                        NavigationLink(
                            destination: ContentView(),
                            label: {
                                Text("Forgot your password?")
                                    .font(.system(size: 13, weight: .semibold))
                                    .foregroundColor(.white)
                                    .padding(.top)
                            })
                    }
                    
                    Button(action: {
                        viewModel.logIn(withEmail: email, password: password)
                    }, label: {
                        Text("Sign In")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)))
                            .clipShape(Capsule())
                            .padding(.top)
                            .padding(.horizontal)
                    })
                    
                    Spacer()
                    
//                    NavigationLink(
//                        destination: RegistrationView(),
//                        label: {
//                            HStack {
//                                Text("Don`t have an account?")
//                                    .font(.system(size: 14))
//
//                                Text("Sign Up")
//                                    .font(.system(size: 14, weight: .semibold))
//                            }.foregroundColor(.white)
//                        }).padding(.bottom, 16)
                    Button("Don`t have an account? Sign Up") {
                        showRegistrationView = true
                    }
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    .sheet(isPresented: $showRegistrationView) {
                        RegistrationView(isPresented: $showRegistrationView)
                    }
                    .padding(.bottom, 16)
                    
                }
//                .padding(.top, -50)
            }
            .background(
                Image("ShareItBG")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            )
            
//        }
        .gesture(
            TapGesture()
                .onEnded { _ in
                    UIApplication.shared.endEditing()
                }
        )
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

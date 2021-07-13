//
//  RegistrationView.swift
//  ShareIt
//
//  Created by Vachko on 9.07.21.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var userName = ""
    @State private var fullName = ""
    @State private var password = ""
    @State private var showingAlert = false
    
    @EnvironmentObject var viewModel: AuthViewModel
//    @Environment(\.presentationMode) var presentationMode
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            
            VStack {
                
                Spacer()
                
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding(.top, 20)
                
                VStack(spacing: 20) {
                    
                    Spacer()
                    
                    CustomTextField(text: $email, placeHolder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 50)
                    
                    CustomTextField(text: $userName, placeHolder: Text("User Name"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 50)
                    
                    CustomTextField(text: $fullName, placeHolder: Text("Full Name"), imageName: "person")
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
                
                Button(action: {
                    viewModel.register(withEmail: email, password: password)
                    showingAlert.toggle()
                }, label: {
                    Text("Sign Up")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)))
                        .clipShape(Capsule())
                        .padding(.top)
                        .padding(.horizontal)
                })
                .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("Alert"),
                        message: Text("Please follow the link on your mail to verify the registration!"),
                        dismissButton: .default(Text("Okay")) {
//                            self.presentationMode.wrappedValue.dismiss()
                            isPresented = false
                        }
                    )
                }
                
                //                NavigationLink(
                //                    destination: MainView()) {
                //                    Text("Sign Up")
                //                        .font(.system(size: 15, weight: .semibold))
                //                        .foregroundColor(.white)
                //                        .frame(width: 300, height: 50)
                //                        .background(Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)))
                //                        .clipShape(Capsule())
                //                        .padding(.top)
                //                        .padding(.horizontal)
                //                }
                
                Spacer()
//
//                NavigationLink(
//                    destination: LoginView(),
//                    label: {
//                        HStack {
//                            Text("Already have an account?")
//                                .font(.system(size: 14))
//
//                            Text("Sign In")
//                                .font(.system(size: 14, weight: .semibold))
//                        }.foregroundColor(.white)
//                    }).padding(.bottom, 16)
                
            }
            .padding(.bottom, 20)
//            .padding(.top, -50)
        }
        .background(
            Image("ShareItBG")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
        .gesture(
            TapGesture()
                .onEnded { _ in
                    UIApplication.shared.endEditing()
                }
        )
    }
}

//struct RegistrationView_Previews: PreviewProvider {
//    static var previews: some View {
//        RegistrationView()
//    }
//}

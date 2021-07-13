//
//  VeryFirstView.swift
//  ShareIt
//
//  Created by Vachko on 9.07.21.
//

import SwiftUI

struct VeryFirstView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            
            Spacer()
            
            VStack(spacing: 20) {
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                    .font(.system(size: 15, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                
                Button (
                    action: {
                        self.presentationMode.wrappedValue.dismiss()
                        UserDefaults.standard.setValue("No", forKey: "isFirstOpenning")
                    },
                    label: {
                        Text("Done")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundColor(.white)
                            .frame(width: 300, height: 50)
                            .background(Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)))
                            .clipShape(Capsule())
                            .padding(.top)
                            .padding(.horizontal)
                    }
                )
                
            }
            
            Spacer()
            
        }
        .background(
            Image("ShareItBG")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
    }
}

struct VeryFirstView_Previews: PreviewProvider {
    static var previews: some View {
        VeryFirstView()
    }
}

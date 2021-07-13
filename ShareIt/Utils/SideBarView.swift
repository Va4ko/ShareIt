//
//  SideBarView.swift
//  ShareIt
//
//  Created by Vachko on 13.07.21.
//

import SwiftUI

struct SideBarView: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Profile")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            .padding(.top, 100)
            
            HStack {
                Image(systemName: "envelope")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Messages")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            .padding(.top, 30)
            
            HStack {
                Image(systemName: "gear")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Settings")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            .padding(.top, 30)
            
            Spacer()
            
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(.bottom, 50)
                .padding(.leading, 20)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.gray))
        .edgesIgnoringSafeArea(.all)
        .shadow(color: .gray, radius: 20, x: 10, y: 0)
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView()
    }
}

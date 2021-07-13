//
//  ShareItApp.swift
//  ShareIt
//
//  Created by Vachko on 1.07.21.
//

import SwiftUI
import Firebase

@main
struct ShareItApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    @StateObject var locationViewModel = MainViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(AuthViewModel())
                .onAppear {
                    locationViewModel.requestPermission()
                }
        }
    }
}

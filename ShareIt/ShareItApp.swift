//
//  ShareItApp.swift
//  ShareIt
//
//  Created by Vachko on 1.07.21.
//

import SwiftUI

@main
struct ShareItApp: App {
    
    @StateObject var locationViewModel = MainViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    locationViewModel.requestPermission()
                }
        }
    }
}

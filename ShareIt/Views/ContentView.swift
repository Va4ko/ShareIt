//
//  ContentView.swift
//  ShareIt
//
//  Created by Vachko on 1.07.21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @StateObject var locationViewModel = MainViewModel()
    
    private let defaults = UserDefaults.standard
    
    var body: some View {
        Group {
            if defaults.object(forKey: "isFirstOpenning") == nil {
                VeryFirstView()
            } else if viewModel.userSession == nil {
                LoginView()
            } else {
                MainView()
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//            .preferredColorScheme(.dark)
//    }
//}

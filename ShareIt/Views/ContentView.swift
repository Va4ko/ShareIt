//
//  ContentView.swift
//  ShareIt
//
//  Created by Vachko on 1.07.21.
//

import SwiftUI

struct ContentView: View {
    
    private let defaults = UserDefaults.standard
    
    var body: some View {
        
//        if defaults.object(forKey: "isFirstOpenning") == nil {
            LoginView()
//        } else {
//            MainView()
//        }
        
    }
    
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//            .preferredColorScheme(.dark)
//    }
//}

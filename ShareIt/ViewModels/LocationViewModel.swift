//
//  LocationViewModel.swift
//  ShareIt
//
//  Created by Vachko on 23.07.21.
//

import Foundation
import SwiftUI

class LocationViewModel: ObservableObject {
    
    @Published var disabled = true
    var country = ""
    var city = ""
    
    func check() {
        if country != "" && country != "Country" && city != "" && city != "City" {
            disabled = false
        } else {
            disabled = true
        }
    }
    
    func send() {
        print("Country: \(country), City: \(city)")
    }
    
}

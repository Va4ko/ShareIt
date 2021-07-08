//
//  Extensions.swift
//  ShareIt
//
//  Created by Vachko on 1.07.21.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}



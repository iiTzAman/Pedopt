//
//  Extensions.swift
//  Pedopt
//
//  Created by Aman Giri on 2024-05-14.
//

import Foundation

extension String {
    var isValidEmail: Bool {
       return NSPredicate(format: "SELF MATCHES[c] %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
}

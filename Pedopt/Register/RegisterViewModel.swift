//
//  RegisterViewModel.swift
//  Pedopt
//
//  Created by Aman Giri on 2024-05-14.
//

import Foundation
import SwiftUI
class RegisterViewModel: ObservableObject {
    
    @Published var error = ""
    @Published var borderFirst = ""
    @Published var borderLast = ""
    @Published var borderEmail = ""
    @Published var borderPass = ""
    @Published var borderConfPass = ""
    @Published var borderContact = ""

    @Published var first = "" {
        didSet {
            if self.first.isEmpty {
                borderFirst = "AccentPink"
            } else {
                borderFirst = "AccentGreen"
            }
        }
    }
    
    @Published var last = "" {
        didSet {
            if self.last.isEmpty {
                borderLast = "AccentPink"
            } else {
                borderLast = "AccentGreen"
            }
        }
    }
    
    @Published var email = "" {
        didSet {
            if self.email.isEmpty {
                borderEmail = "AccentPink"
            } else if !self.email.isValidEmail {
                borderEmail = "AccentPink"
            } else {
                borderEmail = "AccentGreen"
            }
        }
    }
    
    @Published var password = "" {
        didSet {
            if self.password.isEmpty {
                borderPass = "AccentPink"
            } else {
                borderPass = "AccentGreen"
            }
        }
    }
    
    @Published var confirmPass = "" {
        didSet {
            if !(self.confirmPass == self.password) {
                borderConfPass = "AccentPink"
            } else {
                borderConfPass = "AccentGreen"
            }
        }
    }
    
    @Published var contact = "" {
        didSet {
            if self.contact.count <= 10 {
                borderContact = "AccentPink"
            } else {
                borderContact = "AccentGreen"
            }
        }
    }
    
    @Published var filledAll = false
    
    func createNewUser(with email: String, and pass: String){
        
    }
    
    func checkAllFieldsFilled(){
        if first == "" || last == "" || email == "" || password == "" || confirmPass ==
            "" || contact == "" {
            error = "All fields are required!"
        } else {
            error = ""
            filledAll = true
        }
    }
}

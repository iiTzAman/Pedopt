//
//  PedoptApp.swift
//  Pedopt
//
//  Created by Aman Giri on 2024-05-11.
//

import SwiftUI
import Firebase

@main
struct PedoptApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            OnboardingView()
                .preferredColorScheme(.light)
        }
    }
}

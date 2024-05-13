//
//  PedoptApp.swift
//  Pedopt
//
//  Created by Aman Giri on 2024-05-11.
//

import SwiftUI

@main
struct PedoptApp: App {

    var body: some Scene {
        WindowGroup {
            OnboardingView()
                .preferredColorScheme(.light)
        }
    }
}

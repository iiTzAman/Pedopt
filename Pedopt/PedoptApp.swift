//
//  PedoptApp.swift
//  Pedopt
//
//  Created by Aman Giri on 2024-05-11.
//

import SwiftUI

@main
struct PedoptApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

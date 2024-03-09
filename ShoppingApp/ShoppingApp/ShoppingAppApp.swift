//
//  ShoppingAppApp.swift
//  ShoppingApp
//
//  Created by yangsu.baek on 2024/03/07.
//

import SwiftUI

@main
struct ShoppingAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

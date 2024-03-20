//
//  ShoppingAppApp.swift
//  ShoppingApp
//
//  Created by yangsu.baek on 2024/03/07.
//

import SwiftUI

@main
struct ShoppingAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.environmentObject(CartManager())
    }
}

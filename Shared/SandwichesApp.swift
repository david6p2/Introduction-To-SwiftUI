//
//  SandwichesApp.swift
//  Shared
//
//  Created by David Andres Cespedes on 8/10/20.
//

import SwiftUI

@main
struct SandwichesApp: App {
    @StateObject private var store = SandwichStore()

    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}

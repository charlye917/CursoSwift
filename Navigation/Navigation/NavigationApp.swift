//
//  NavigationApp.swift
//  Navigation
//
//  Created by Charlye Arteaga on 07/12/21.
//

import SwiftUI

@main
struct NavigationApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            //ContentView()
            TabViewVista()
        }
    }
}

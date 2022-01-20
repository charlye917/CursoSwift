//
//  DisenoApp.swift
//  Diseno
//
//  Created by Charlye Arteaga on 28/11/21.
//

import SwiftUI

@main
struct DisenoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

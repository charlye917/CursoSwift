//
//  NotasApp.swift
//  Notas
//
//  Created by Charlye Arteaga on 17/01/22.
//

import SwiftUI

@main
struct NotasApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
    

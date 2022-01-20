//
//  TestCombineApp.swift
//  TestCombine
//
//  Created by Charlye Arteaga on 13/01/22.
//

import SwiftUI

@main
struct TestCombineApp: App {
    
    //para el EnvireomentObject
    var modelo = Modelo()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(modelo)
        }
    }
}

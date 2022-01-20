//
//  TabViewVista.swift
//  Navigation
//
//  Created by Charlye Arteaga on 07/12/21.
//

import SwiftUI

struct TabViewVista: View {
    var body: some View {
        TabView{
            ContentView()
                .tabItem{
                    Text("Inicio")
                    Image(systemName: "house")
                }
            SegundaVista(saludo: "Hola carlos")
                .tabItem{
                    Text("Inicio")
                    Image(systemName: "doc")
                }
            TerceraVista()
                .tabItem{
                    Text("Inicio")
                    Image(systemName: "gear")
                }
        }
    }
}


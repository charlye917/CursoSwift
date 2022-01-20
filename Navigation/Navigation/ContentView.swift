//
//  ContentView.swift
//  Navigation
//
//  Created by Charlye Arteaga on 07/12/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State private var show = false
    let saludo = "Hola como estas"
    
    var body: some View{
        NavigationView {
            VStack{
                Button(action: {
                    show = true
                }){
                    Text("Abrir ventana modal")
                }
                NavigationLink(
                    destination: SegundaVista(saludo: saludo),
                    label: {
                        Text("Navegar a segunda lista")
                    })
            }.sheet(
                isPresented: $show, content: {
                    Modal()
                }
            ).navigationBarTitle(
                "Mi titulo",
                displayMode: .inline
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  SegundaVista.swift
//  Navigation
//
//  Created by Charlye Arteaga on 07/12/21.
//

import SwiftUI

struct SegundaVista: View {
    
    var saludo: String
    
    var body: some View {
        ZStack{
            Color
                .green
                .ignoresSafeArea()
            Text(saludo).font(.largeTitle).bold()
        }.navigationBarTitle("Segunda vista")
        .navigationBarItems(trailing:
            NavigationLink(
                destination: TerceraVista(),
                label: {
                    Image(systemName: "plus")
                }
            )
        )
    }
}

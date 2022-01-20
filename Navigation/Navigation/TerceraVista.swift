//
//  TerceraVista.swift
//  Navigation
//
//  Created by Charlye Arteaga on 07/12/21.
//

import SwiftUI

struct TerceraVista: View {
    var body: some View {
        ZStack{
            Color.red.edgesIgnoringSafeArea(.all)
            Text("Tercera ventana").font(.largeTitle).bold()
        }.navigationBarTitle("Tercera vista")
    }
}


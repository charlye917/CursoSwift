//
//  Modal.swift
//  Navigation
//
//  Created by Charlye Arteaga on 07/12/21.
//

import SwiftUI

struct Modal: View {
    var body: some View {
        ZStack{
            Color.blue.edgesIgnoringSafeArea(.all)
            Text("Ventana modal")
                .font(.largeTitle)
                .foregroundColor(.white)
                .bold()
        }
    }
}

//
//  ContentView.swift
//  TestCombine
//
//  Created by Charlye Arteaga on 13/01/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var contador = Modelo()
    
    var body: some View {
        VStack{
            Text("Contador = \(contador.contador)")
            Button("Sumar contador (Reiniciar)"){
                contador.contador += 1
            }
            Spacer()
            vista2()
            Spacer()
            vista3()
            Spacer()
            vista4()
            Spacer()
            vista5()
        }
    }
}

struct vista2: View {
    
    @ObservedObject var contador = Modelo()
    
    var body: some View {
        VStack{
            Text("Contador vista 2(ObservedObject) = \(contador.contador)")
            Button("Sumar contador"){
                contador.contador += 1
            }
        }
    }
}

struct vista3: View {
    
    @StateObject var contador = Modelo()
    
    var body: some View {
        VStack{
            Text("Contador vista 3(StateObject) = \(contador.contador)")
            Button("Sumar contador"){
                contador.contador += 1
            }
        }
    }
}

struct vista4: View {
    
    @EnvironmentObject var contador : Modelo
    
    var body: some View {
        VStack{
            Text("Contador vista 4(EnvireomentObject) = \(contador.contador)")
            Button("Sumar contador"){
                contador.contador += 1
            }
        }
    }
}

struct vista5: View {
    
    @EnvironmentObject var contador : Modelo
    
    var body: some View {
        VStack{
            Text("Contador vista 5(EnvireomentObject) = \(contador.contador)")
            Button("Sumar contador"){
                contador.contador += 1
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

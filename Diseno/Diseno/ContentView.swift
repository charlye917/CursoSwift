//
//  ContentView.swift
//  Diseno
//
//  Created by Charlye Arteaga on 28/11/21.
//

import SwiftUI
import CoreData

//vstack vertical
// hstack horizontal
// zstack fondo


struct ContentView: View {
    
    //valores de entorno o enviromentValues
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var body: some View {
        if sizeClass == .compact{
            compactDesignt()
        }else{
            regularDesignt()
        }
    }
}

struct compactDesignt: View{
    var body : some View{
        ZStack{
            Color.green.edgesIgnoringSafeArea(.all)
            VStack(){
                Image("IMG_0012")
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
                    .clipShape(Circle())
                Image(systemName: "person.crop.circle")
                    .font(.system(size: 100, weight: .bold))
                    .foregroundColor(.green)
                    Text("CARLOS ARTEAGA")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()
                    Text("CHARLYE934")
                        .foregroundColor(.white)
                        .font(.title)
                        .italic()
            }
        }
    }
}

struct regularDesignt: View{
    
    let numero = "5542909198"
    let mensaje = "Que onda Mickey?"
    
    func sendMessage(){
        let sms = "sms: \(numero)&body=\(mensaje)"
        guard let stringSMS = sms.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            else { return }
        UIApplication.shared.open(URL.init(string: stringSMS)!, options: [:], completionHandler: nil)
    }
    
    func sendCall(){
        guard let number = URL(string: "tel://\(numero)") else{return}
        UIApplication.shared.open(number)
        
    }
    
    var body : some View{
        ZStack{
            Color.blue.edgesIgnoringSafeArea(.all)
            VStack(){
                Image("IMG_0012")
                    .resizable()
                    .frame(width: 200, height: 200, alignment: .center)
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 10){
                    Text("CARLOS ARTEAGA")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .bold()
                    Text("CHARLYE934")
                        .foregroundColor(.white)
                        .font(.title)
                        .italic()
                }
                HStack(){
                    Button(action: {
                      sendCall()
                    }){
                        Image(systemName: "phone.fill")
                            .modifier(boton(color: .green))
                    }
                    
                    Button(action: {
                      sendMessage()
                    }){
                        Image(systemName: "message.fill")
                            .modifier(boton(color: .red))
                    }
                }
            }
        }
    }
}

struct boton: ViewModifier{
    var color: Color
    func body(content: Content) -> some View {
        content
            .padding()
            .background(color)
            .clipShape(Circle())
            .foregroundColor(.white)
            .font(.title)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

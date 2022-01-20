//
//  addView.swift
//  Notas
//
//  Created by Charlye Arteaga on 17/01/22.
//

import SwiftUI

struct addView: View {
    
    @ObservedObject var model: ViewModel
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        VStack{
            Text("Agregar nota")
                .font(.largeTitle)
                .bold()
            Spacer()
            TextEditor(text: $model.nota)
            Divider()
            DatePicker("Selecciona fecha", selection: $model.fecha)
            Spacer()
            Button(action: {
                if model.updateItem != nil{
                    model.editData(context: context)
                }else{
                    model.saveData(context: context)
                }
            }){
                Label(
                    title: {Text("Guardar").foregroundColor(.white).bold()},
                    icon: {Image(systemName: "plus").foregroundColor(.blue)}
                )
            }.padding()
                .frame(width: UIScreen.main.bounds.width - 30)
                .background(model.nota == "" ? Color.gray :  Color.blue)
                .cornerRadius(8)
                .disabled(model.nota == "" ? true : false)
        }.padding()
    }
}

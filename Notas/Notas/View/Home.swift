//
//  Home.swift
//  Notas
//
//  Created by Charlye Arteaga on 17/01/22.
//

import SwiftUI

struct Home: View {
    
    @StateObject var model = ViewModel()
    @Environment (\.managedObjectContext) var context
    /*@FetchRequest(entity: Notas.entity(), sortDescriptors: [
        NSSortDescriptor(key: "fecha",ascending: true)
    ], animation: .spring()) var results: FetchedResults<Notas>*/
    @FetchRequest(entity: Notas.entity(), sortDescriptors: [], predicate: NSPredicate(format: "fecha  <= %@", Date() as CVarArg), animation: .spring()) var results: FetchedResults<Notas>
    
    var body: some View {
        NavigationView{
            List{
                ForEach(results){ item in
                    VStack(alignment: .leading){
                        Text(item.notas ?? "Sin nota")
                            .font(.title)
                            .bold()
                        Text(item.fecha ?? Date(), style: .date)
                    }.contextMenu(menuItems: {
                        Button(action: {
                            model.sendData(item: item)
                        }){
                            Label(title:{
                                Text("Editar")
                            }, icon: {
                                Image(systemName: "pencil")
                            })
                        }
                        Button(action: {
                            model.deleteData(item: item, context: context)
                        }){
                            Label(title:{
                                Text("Eliminar")
                            }, icon: {
                                Image(systemName: "trash")
                            })
                        }
                    })
                }
            }.navigationBarTitle("Notas")
            .navigationBarItems(trailing:
                Button(action: {
                    model.show.toggle()
                }){
                    Image(systemName: "plus")
                        .font(.title)
                        .foregroundColor(.blue)
                }
            ).sheet(isPresented: $model.show, content: {
                addView(model: model)
            }
        )
        }
    }
}

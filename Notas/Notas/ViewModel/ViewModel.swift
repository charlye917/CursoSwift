//
//  ViewModel.swift
//  Notas
//
//  Created by Charlye Arteaga on 17/01/22.
//

import Foundation
import CoreData
import SwiftUI

class ViewModel: ObservableObject{
    @Published var nota = ""
    @Published var fecha = Date()
    @Published var show = false
    @Published var updateItem: Notas!
    
    //CoreData
    func saveData(context: NSManagedObjectContext){
        let newNota = Notas(context: context)
        newNota.notas = nota
        newNota.fecha = fecha
        
        do{
            try context.save()
            print("guardo el registro")
            show.toggle()
        }catch let error as NSError{
            print("No se pudo guardar", error.localizedDescription)
        }
    }
    
    func deleteData(item: Notas, context: NSManagedObjectContext ){
        context.delete(item)
        //try! context.save()
        do{
            try context.save()
            print("Elimino")
        }catch let error as NSError{
            print("No elimino", error.localizedDescription)
        }
    }
    
    func sendData(item: Notas){
        updateItem = item
        nota = item.notas ?? ""
        fecha = item.fecha ?? Date()
        show.toggle()
    }
    
    func editData(context: NSManagedObjectContext){
        updateItem.fecha = fecha
        updateItem.notas = nota
        do{
            try context.save()
            show.toggle()
        }catch let error as NSError{
            print("no edito", error.localizedDescription)
        }
    }
}

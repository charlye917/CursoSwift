//
//  Model.swift
//  NotasSB
//
//  Created by Charlye Arteaga on 24/01/22.
//

import UIKit
import CoreData

class Modelo{
    
    public static let shared = Modelo()
    
    func context() -> NSManagedObjectContext{
        //Referencia al managed object context
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext
    }
    
    func saveData(titulo: String, nota: String, fecha: Date){
        let contexto = context()
        let entityNotas = NSEntityDescription.insertNewObject(forEntityName: "Notas", into: contexto) as! Notas
        
        entityNotas.titulo = titulo
        entityNotas.nota = nota
        entityNotas.fecha = fecha
        
        do{
            try contexto.save()
            print("guardo")
        }catch let error as NSError{
            print("no guardo", error.localizedDescription)
        }
    }
    
    func editData(titulo: String, nota: String, fecha:Date, notas: Notas){
        let context = context()
        notas.setValue(titulo, forKey: "titulo")
        notas.setValue(nota, forKey: "nota")
        notas.setValue(fecha, forKey: "fecha")
        
        do{
            try context.save()
            print("se edito")
        }catch let error as NSError{
            print("no edito", error.localizedDescription)
        }
    }
}

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
}

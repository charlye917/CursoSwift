//
//  Notas+CoreDataProperties.swift
//  NotasSB
//
//  Created by Charlye Arteaga on 25/01/22.
//
//

import Foundation
import CoreData


extension Notas {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Notas> {
        return NSFetchRequest<Notas>(entityName: "Notas")
    }

    @NSManaged public var fecha: Date?
    @NSManaged public var nota: String?
    @NSManaged public var titulo: String?

}

extension Notas : Identifiable {

}

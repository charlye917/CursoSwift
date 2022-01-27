//
//  Pais+CoreDataProperties.swift
//  TableViews
//
//  Created by Charlye Arteaga on 25/01/22.
//  Copyright © 2022 MoureDev. All rights reserved.
//
//

import Foundation
import CoreData


extension Pais {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pais> {
        return NSFetchRequest<Pais>(entityName: "Pais")
    }

    @NSManaged public var name: String?

}

extension Pais : Identifiable {

}

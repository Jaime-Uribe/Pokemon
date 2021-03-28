//
//  PokemonEntity+CoreDataProperties.swift
//  
//
//  Created by Jaime Uribe on 27/03/21.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension PokemonEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PokemonEntity> {
        return NSFetchRequest<PokemonEntity>(entityName: "PokemonEntity")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var namePowerOne: String?
    @NSManaged public var urlImage: String?

}

extension PokemonEntity : Identifiable {

}

//
//  SaveFavoriteDataRepository.swift
//  Pokemon
//
//  Created by Jaime Uribe on 19/03/21.
//

import Foundation
import CoreData
import RxSwift

protocol FavoriteDataSource {
    func savePokemon(pokemon: Pokemon) -> Observable<Bool>
}


class CoreDataRepository: FavoriteDataSource {
    
    
    func savePokemon(pokemon: Pokemon) -> Observable<Bool> {
        let context = CoreDataService.context
        
        let entity = NSEntityDescription.entity(forEntityName: "PokemonEntity", in: context)!
        let task = NSManagedObject(entity: entity, insertInto: context)
        task.setValue(Int64(pokemon.id!), forKey: "id")
        task.setValue(pokemon.name, forKey: "name")
        task.setValue(pokemon.powerName, forKey: "namePowerOne")
        task.setValue(pokemon.imageURL, forKey: "urlImage")
        
        
        do {
            try context.save()
            print("We have been save your pokemon")
            return Observable.just(true)
            
        } catch {
            print("Error with data — \(error)")
            return Observable.error(error)
        }
    }
    
}

class LocalStorageRepository: FavoriteDataSource {
    func savePokemon(pokemon: Pokemon) -> Observable<Bool> {
        return Observable.just(true)
    }
    
    
}


class Test: FavoriteDataSource {
    func savePokemon(pokemon: Pokemon) -> Observable<Bool> {
        return Observable.just(false)
    }
    
    
}

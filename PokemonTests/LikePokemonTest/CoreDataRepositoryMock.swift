//
//  File.swift
//  PokemonTests
//
//  Created by Jaime Uribe on 23/03/21.
//

import Foundation
import RxSwift

class CoreDataRepositoryMock: FavoriteDataSource  {
    
    var coreDateSucess: Bool = false
    
    func savePokemon(pokemon: Pokemon) -> Observable<Bool>{
        guard pokemon.id != nil else {
            return Observable.just(false)
        }
        
        coreDateSucess = true
        return Observable.just(true)
    }
}

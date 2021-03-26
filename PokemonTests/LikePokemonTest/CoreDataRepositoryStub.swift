//
//  File.swift
//  PokemonTests
//
//  Created by Jaime Uribe on 23/03/21.
//

import Foundation
import RxSwift

class CoreDataRepositoryStub: FavoriteDataSource  {
    
    var coreDateSucess: Bool!
    
    func savePokemon(pokemon: Pokemon) -> Observable<Bool>{
        guard pokemon.id != nil else {
            coreDateSucess = false
            return Observable.error(Fakes.createError())
        }
        
        coreDateSucess = true
        return Observable.just(true)
    }
}

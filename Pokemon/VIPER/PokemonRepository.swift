//
//  PokemonRepository.swift
//  Pokemon
//
//  Created by Jaime Uribe on 19/03/21.
//

import Foundation
import RxSwift
import CoreData


protocol FavoritePokemonRepository {
    func addPokemon(pokemon: Pokemon) -> Observable<Bool>
}


class PokemonRepository: FavoritePokemonRepository {
    
    private let saveLocalCoreData: FavoriteDataSource
    
    init(saveLocalCoreData: FavoriteDataSource) {
        self.saveLocalCoreData = saveLocalCoreData
    }
    
    func addPokemon(pokemon: Pokemon) -> Observable<Bool> {
        return saveLocalCoreData.savePokemon(pokemon: pokemon).asObservable().flatMap({ response -> Observable<Bool> in
            return Observable.just(response)
        })
    }
    
}

//
//  likePokemons.swift
//  Pokemon
//
//  Created by Jaime Uribe on 18/03/21.
//

import Foundation
import RxSwift
import CoreData

final class LikePokemonsInteractor: InputInteractorSavePokemonType {
    
    private let disposeBag = DisposeBag()
    var presenter: OuputInteractorSavePokemonType?
    var repository: FavoritePokemonRepository?
    
    init(pokemonSaveRepository: FavoritePokemonRepository) {
        repository = pokemonSaveRepository
    }
    
    func savePokemon(pokemon: Pokemon) {
        
        repository?.addPokemon(pokemon: pokemon).asObservable().retry(1).subscribe(
            onNext: { [weak self] _ in
                self?.presenter?.savePokemonSucess()
            }, onError: { [weak self] _ in
                self?.presenter?.savePokemonFailed()
            }
        ).disposed(by: disposeBag)
    }
    
}

//
//  PokemonLikePresenter.swift
//  Pokemon
//
//  Created by Jaime Uribe on 18/03/21.
//

import Foundation

final class PokemonLikePresenter: InputPresenterSavePokemonType {
    
    weak var view: OutputPresenterPokemonSavable?
    var interactor: InputInteractorSavePokemonType?
    var router: PresenterToRouterToLikePokemonProtocol?
    
    func savePokemon(pokemon: Pokemon) {
        interactor?.savePokemon(pokemon: pokemon)
    }
    
}

extension PokemonLikePresenter: OuputInteractorSavePokemonType{
    func savePokemonSucess() {
        view?.onSavePokemonResponseSucess()
    }
    
    func savePokemonFailed() {
        view?.onSavePokemonResponseFailed()
    }
    
    
}



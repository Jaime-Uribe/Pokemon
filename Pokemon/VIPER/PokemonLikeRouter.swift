//
//  PokemonLikeRouter.swift
//  Pokemon
//
//  Created by Jaime Uribe on 18/03/21.
//

import Foundation

class PokemonLikeRouter: PresenterToRouterToLikePokemonProtocol {
    
    
    class func createDetailPokemonView(reference: LikeViewController) {
        let presenter: InputPresenterSavePokemonType & OuputInteractorSavePokemonType = PokemonLikePresenter()
        let repository: FavoritePokemonRepository = PokemonRepository(saveLocalCoreData: Test())
        
        reference.savePokemonPresenter = presenter
        reference.savePokemonPresenter.view = reference
        reference.savePokemonPresenter.router = PokemonLikeRouter()
        reference.savePokemonPresenter.interactor = LikePokemonsInteractor.init(pokemonSaveRepository: repository)
        reference.savePokemonPresenter.interactor?.presenter = presenter
        
    }
    
    
}

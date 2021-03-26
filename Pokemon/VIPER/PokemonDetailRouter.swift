//
//  PokemonDetailRouter.swift
//  Pokemon
//
//  Created by Jaime Uribe on 17/03/21.
//

import Foundation
import UIKit

class PokemonDetailRouter: PresenterToRouterDetailPokemonType {
    
    class func createDetailPokemonView(detailReference: PokemonDetailViewController) {
        let pokemonApiRepository =  PokemonApiRepository()
        let presenter: ViewToPresenterDetailPokemonType = PokemonDetailPresenter(getDetailPokemonInteractor: GetPokemonDetailInteractor.init(pokemonBL: PokemonListBL(repository: pokemonApiRepository)))
        
        detailReference.detailPresenter = presenter
        detailReference.detailPresenter.view = detailReference
        detailReference.detailPresenter.router = PokemonDetailRouter()
    }
    
    func closeView(view: UIViewController) {
        view.navigationController?.popToRootViewController(animated: true)
        view.dismiss(animated: true)
    }
    
    
}

//
//  PokemonDetailPresenter.swift
//  Pokemon
//
//  Created by Jaime Uribe on 17/03/21.
//

import Foundation
import RxSwift

class PokemonDetailPresenter: ViewToPresenterDetailPokemonType {
    
    lazy var disposeBag = DisposeBag()
    
    weak var view: PresenterToViewDetailPokemonResponsable?
    var router: PresenterToRouterDetailPokemonType?
    var getDetailPokemonInteractor: ObservableInteractor<DescriptionPokemonResponse, Int>?
    
    required init(getDetailPokemonInteractor: ObservableInteractor<DescriptionPokemonResponse, Int>){
        self.getDetailPokemonInteractor = getDetailPokemonInteractor
    }
    
    
    
    func fetchPokemon(idPokemon: Int) {
        getDetailPokemonInteractor?.excute(
            params: idPokemon,
            onSuccess: { [weak self] detail in
                self?.getDetailDescriptionPokemon(pokemonDescriptions: detail)
            }, onError: { [weak self] error in
                self?.view?.onDetailPokemonResponseFailed()
        }).disposed(by: disposeBag)
        
    }
    
    func closeViewDetail(view: PokemonDetailViewController) {
        router?.closeView(view: view)
    }
    
    private func getDetailDescriptionPokemon(pokemonDescriptions: DescriptionPokemonResponse){
        
        for description in pokemonDescriptions.flavor_text_entries!{
            if description.language?.name == "en"{
                view?.onDetailPokemonResponseSucess(datail: description.flavor_text!)
                return
            }
        }
    }
    
}

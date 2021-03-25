//
//  saveLikePokemonsProtocols.swift
//  Pokemon
//
//  Created by Jaime Uribe on 18/03/21.
//

import Foundation


protocol InputPresenterSavePokemonType: AnyObject {
    
    var view: OutputPresenterPokemonSavable? {get set}
    var interactor: InputInteractorSavePokemonType? {get set}
    var router: PresenterToRouterToLikePokemonProtocol? {get set}
    
    func savePokemon(pokemon: Pokemon)
    
}

protocol OutputPresenterPokemonSavable: AnyObject {
    func onSavePokemonResponseSucess()
    func onSavePokemonResponseFailed()
    
}

protocol InputInteractorSavePokemonType: AnyObject {
    var presenter: OuputInteractorSavePokemonType? {get set}
    func savePokemon(pokemon: Pokemon)
}

protocol OuputInteractorSavePokemonType: AnyObject {
    func savePokemonSucess()
    func savePokemonFailed()
}

protocol PresenterToRouterToLikePokemonProtocol {
    static func createDetailPokemonView(reference: LikeViewController)
}



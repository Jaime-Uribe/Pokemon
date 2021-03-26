//
//  DetailsProtocols.swift
//  Pokemon
//
//  Created by Jaime Uribe on 17/03/21.
//

import Foundation
import UIKit

protocol ViewToPresenterDetailPokemonType: AnyObject {
    var view: PresenterToViewDetailPokemonResponsable? {get set}
    //var interator: PresenterToInteractorDetailPokemonType? {get set}
    var getDetailPokemonInteractor: ObservableInteractor<DescriptionPokemonResponse, Int>? {get}
    var router: PresenterToRouterDetailPokemonType? {get set}
    
    func fetchPokemon(idPokemon: Int)
    func closeViewDetail(view: PokemonDetailViewController)
}

protocol PresenterToViewDetailPokemonResponsable: AnyObject {
    func onDetailPokemonResponseSucess(datail: String)
    func onDetailPokemonResponseFailed()
    
}

protocol PresenterToRouterDetailPokemonType: AnyObject {
    static func createDetailPokemonView(detailReference: PokemonDetailViewController)
    func closeView(view: UIViewController)
}

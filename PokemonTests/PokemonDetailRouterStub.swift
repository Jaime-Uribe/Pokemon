//
//  PokemonDetailRouterMock.swift
//  PokemonTests
//
//  Created by Jaime Uribe on 25/03/21.
//

import Foundation
import UIKit

class PokemonDetailRouterStub: PresenterToRouterDetailPokemonType {
    
    static var closeWindow = false
    
    static func createDetailPokemonView(detailReference: PokemonDetailViewController) {
        closeWindow = false
    }
    
    func closeView(view: UIViewController) {
        PokemonDetailRouterStub.closeWindow = true
    }
    
    
}

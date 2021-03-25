//
//  ViewLikePresenterTesteable.swift
//  PokemonTests
//
//  Created by Jaime Uribe on 23/03/21.
//

import Foundation

class ViewLikePresenterMock: OutputPresenterPokemonSavable{
    
    var responseSavePokemonSucess: Bool = false
    
    func onSavePokemonResponseSucess() {
        responseSavePokemonSucess = true
    }
    
    func onSavePokemonResponseFailed() {
        responseSavePokemonSucess = false
    }
    
    
}

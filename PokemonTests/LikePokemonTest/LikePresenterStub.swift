//
//  LikePresenterMocke.swift
//  PokemonTests
//
//  Created by Jaime Uribe on 23/03/21.
//

import Foundation

class LikePresenterStub: OuputInteractorSavePokemonType {
    var saveSucess: Bool = false
    var saveFailed: Bool = false
    
    func savePokemonSucess() {
        saveSucess = true
    }
    
    func savePokemonFailed() {
        saveFailed = true
    }
    
}

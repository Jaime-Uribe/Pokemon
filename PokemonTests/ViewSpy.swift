//
//  viewPresenterTestable.swift
//  PokemonTests
//
//  Created by Jaime Uribe on 22/03/21.
//

import Foundation

class ViewSpy: PresenterToViewDetailPokemonResponsable {
    
    typealias CompletionTask = (() -> Void)
    var removeCallBack: CompletionTask!
    
    var detailTest: String = ""
    var detailTestFaliled: Bool = false
    
    func onDetailPokemonResponseSucess(datail: String) {
        detailTest = datail
        removeCallBack()
    }
    
    func onDetailPokemonResponseFailed() {
        detailTestFaliled = true
        removeCallBack()
    }
}

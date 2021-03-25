//
//  PokemonLikeInteractorTest.swift
//  PokemonTests
//
//  Created by Jaime Uribe on 23/03/21.
//

import XCTest
import RxSwift

@testable import Pokemon

class PokemonLikeInteractorTest: XCTestCase {
    
    let pokemon = Fakes.pokemon
    
    private let disposBag = DisposeBag()
    private var repositoryTesteable: FavoritePokemonRepository?
    private var presenterMock = LikePresenterMock()
    private var sut: LikePokemonsInteractor!
    
    override func setUp() {
        super.setUp()
        repositoryTesteable = PokemonRepository(saveLocalCoreData: CoreDataRepositoryMock())
        sut = LikePokemonsInteractor(pokemonSaveRepository: repositoryTesteable!)
        sut.presenter =  presenterMock
    }
    
    func testSavePokemonSucess(){
        sut.savePokemon(pokemon: pokemon)
        
        XCTAssert(presenterMock.saveSucess)
    }
    
    func testSavePokemonFailed(){
        sut.savePokemon(pokemon: pokemon)
        
        XCTAssert(presenterMock.saveSucess)
    }
    
}

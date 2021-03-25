//
//  PokemonLikePresenterTest.swift
//  PokemonTests
//
//  Created by Jaime Uribe on 23/03/21.
//

import XCTest
import RxSwift

@testable import Pokemon

class PokemonLikePresenterTest: XCTestCase {
    
    private let pokemon = Fakes.pokemon
    private let disposBag = DisposeBag()
    private var interactorTest: InputInteractorSavePokemonType?
    private var presenter: OuputInteractorSavePokemonType?
    private var sut: PokemonLikePresenter?
    private let viewLikePresenterTesteable = ViewLikePresenterMock()
    private var coreDataRepositoryTesteable = CoreDataRepositoryMock()
    private var repositoryTesteable: FavoritePokemonRepository!
    
    override  func setUp() {
        repositoryTesteable = PokemonRepository(saveLocalCoreData: coreDataRepositoryTesteable)
        sut = PokemonLikePresenter()
        sut!.interactor = LikePokemonsInteractor(pokemonSaveRepository: repositoryTesteable)
        sut!.interactor!.presenter = PokemonLikePresenter()
        
    }
    
    func testLikePokemonPresenter(){
        sut!.savePokemon(pokemon: pokemon)
        sut!.view = viewLikePresenterTesteable
        XCTAssert(coreDataRepositoryTesteable.coreDateSucess)
    }
    
    func testLikePokemonPresenterFailed(){
        sut!.savePokemon(pokemon: Fakes.pokemonWithError)
        sut!.view = viewLikePresenterTesteable
        XCTAssert(!coreDataRepositoryTesteable.coreDateSucess)
    }


}

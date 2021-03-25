//
//  PokemonDetailPreseterTest.swift
//  PokemonTests
//
//  Created by Jaime Uribe on 22/03/21.
//

import XCTest
import RxSwift

@testable import Pokemon


class PokemonDetailPreseterTest: XCTestCase {
    
    let disposeBag = DisposeBag()
    private let idPokemon: Int = 1
    private var pokemonDetailInteractorMock: PokemonListBLBehavior!
    private var pokemonDetailInteractorFailedMock: PokemonListBLBehavior!
    private var observableInteractor: ObservableInteractor<DescriptionPokemonResponse, Int>?
    private var viewTestable: ViewPresenterMock!
    private var routerTesteble: PresenterToRouterDetailPokemonType?
    private var sut: ViewToPresenterDetailPokemonType!
    
    override func setUp() {
        super.setUp()
        viewTestable = ViewPresenterMock()
        pokemonDetailInteractorMock = PokemonMock()
        pokemonDetailInteractorFailedMock = PokemonWhitErrorMock()
        
    }
    
    
    // 
    override func tearDown() {
        sut = nil
        viewTestable = nil
        observableInteractor = nil
        pokemonDetailInteractorMock = nil
        pokemonDetailInteractorFailedMock = nil
        super.tearDown()
        
    }
    
    
    func testPokemonDetailPresenter(){
        let expectation = XCTestExpectation(description: "Call pokemon detail presenter")
        observableInteractor = GetPokemonDetailInteractor(pokemonBL: pokemonDetailInteractorMock)
        sut = PokemonDetailPresenter(getDetailPokemonInteractor: observableInteractor!)
        sut.view = viewTestable
        
        viewTestable.removeCallBack = {
            expectation.fulfill()
        }
        sut.fetchPokemon(idPokemon: idPokemon)
        wait(for: [expectation], timeout: 1.0)
        XCTAssertTrue(!viewTestable.detailTest.isEmpty)
    }
    
    func testPokemonCloseViewDetail(){
        
        observableInteractor = GetPokemonDetailInteractor(pokemonBL: pokemonDetailInteractorMock)
        sut = PokemonDetailPresenter(getDetailPokemonInteractor: observableInteractor!)
        sut.router = PokemonDetailRouter()
        sut.view = viewTestable
        
        sut.fetchPokemon(idPokemon: idPokemon)
        wait(for: [expectation], timeout: 1.0)
        XCTAssertTrue(!viewTestable.detailTest.isEmpty)
        
    }
    
//    func testPokemonDetailPresenterFail(){
//        let expectation = XCTestExpectation(description: "Call pokemon detail presenter failed")
//        observableInteractor = GetPokemonDetailInteractor(pokemonBL: pokemonDetailInteractorFailedMock)
//        sut = PokemonDetailPresenter(getDetailPokemonInteractor: observableInteractor!)
//        sut.view = viewTestable
//        
//        viewTestable.removeCallBack = {
//            expectation.fulfill()
//        }
//        sut.fetchPokemon(idPokemon: 1)
//        wait(for: [expectation], timeout: 1.0)
//        XCTAssertTrue(viewTestable.detailTestFaliled)
//    }

}

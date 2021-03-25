//
//  GetPokemonDetailInteractorTestable.swift
//  PokemonTests
//
//  Created by Jaime Uribe on 22/03/21.
//

import XCTest
import RxSwift

@testable import Pokemon

class GetPokemonDetailInteractorTest: XCTestCase {
    
    private let disposeBag = DisposeBag()
    private let idPokemon: Int = 1
    private var pokemonDetailInteractoMock: PokemonListBLBehavior!
    private var sut: ObservableInteractor<DescriptionPokemonResponse, Int>?
    
    
    override func setUp() {
        super.setUp()
        pokemonDetailInteractoMock = PokemonMock()
        sut = GetPokemonDetailInteractor(pokemonBL:  pokemonDetailInteractoMock)
    }
    
    func testPokemonDetailInteractor(){
        sut?.excute(
            params: idPokemon,
            onSuccess: { response in
                print (response.base_happiness as Any)
                XCTAssert(true)
            }, onError: { _ in
                XCTFail()
            }).disposed(by: disposeBag)
    }
    
    
    func testPokemonDetailFailInteractor(){
        
        pokemonDetailInteractoMock = PokemonWhitErrorMock()
        sut = GetPokemonDetailInteractor(pokemonBL:  pokemonDetailInteractoMock)
        
        sut?.excute(
            params: idPokemon,
            onSuccess: { response in
                print (response.base_happiness as Any)
                XCTAssert(true)
            }, onError: { _ in
                XCTAssert(false)
                //XCTFail()
            }).disposed(by: disposeBag)
    }

}

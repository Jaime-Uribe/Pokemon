//
//  PokemonDetailViewModel.swift
//  Pokemon
//
//  Created by Jaime Uribe on 24/01/21.
//

import Foundation
import RxSwift
import Moya
import RxCocoa

class PokemonDetailViewModel: ViewModelProtocol {
    
    //MARK: -Properties
    let disposeBag = DisposeBag()
    var pokemonBLBehavior: PokemonListBLBehavior
    
    
    let input : Input
    var output : Output
    
    //MARK: -Input and Output
    struct Input {
        var idPokemon = BehaviorRelay<Int>(value: 0)
    }
    
    struct Output{
        var descriptionPokemons = BehaviorRelay<String?>(value: nil)
        var isError = BehaviorRelay<Bool>(value: false)
    }
    
    init() {
        input = Input()
        output = Output()
        pokemonBLBehavior = PokemonListBL(repository: PokemonApiRepository())
        build()
    }
    
    init(pokemonDetailBL: PokemonListBLBehavior) {
        input = Input()
        output = Output()
        pokemonBLBehavior = pokemonDetailBL
        build()
    }
    
    func build(){
        self.input.idPokemon.subscribe(
            onNext: {[weak self] idPokemon in
                
                if idPokemon != 0{
                    self?.getDescriptionPokemon(idPokemon: idPokemon)
                }
            }).disposed(by: disposeBag)
    }
    
    
    func getDescriptionPokemon(idPokemon: Int){
        do {
            
            try pokemonBLBehavior.getPoKemonDescription(idPokemon: idPokemon).asObservable().retry(1).subscribe(
                onNext: {[weak self] response in
                    for description in response.flavor_text_entries!{
                        if description.language?.name == "en"{
                            self?.output.descriptionPokemons.accept(description.flavor_text)
                            return
                        }
                    }
                }, onError: { responseError in
                    self.output.isError.accept(true)
                    print("Error")
                }).disposed(by: disposeBag)
        } catch {
            print("Error")
        }
    }
}

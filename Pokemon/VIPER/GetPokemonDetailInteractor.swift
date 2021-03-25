//
//  PokemonDetailInteractor.swift
//  Pokemon
//
//  Created by Jaime Uribe on 17/03/21.
//

import Foundation
import RxSwift
import Moya
import RxCocoa

protocol Interactor {
    associatedtype Response
    associatedtype Params
    
    func excute(params: Params, onSuccess: @escaping (Response) -> Void, onError: @escaping (Error) -> Void) -> Disposable
}

open class ObservableInteractor<R, P>: Interactor{
    public typealias Response = R
    public typealias Params = P
    
    func excute(params: Params, onSuccess: @escaping (Response) -> Void, onError: @escaping (Error) -> Void) -> Disposable {
        return buildUseCase(params: params)
            .observeOn(MainScheduler.instance)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .subscribe(onNext: onSuccess, onError: onError)
    }
    
    open func buildUseCase(params: Params) -> Observable<Response>{
        return Observable.create({ _ in
            return Disposables.create()
        })
        
    }
    
}

final class GetPokemonDetailInteractor: ObservableInteractor<DescriptionPokemonResponse, Int> {
    
    var pokemonBLBehavior: PokemonListBLBehavior
    
    init(pokemonBL: PokemonListBLBehavior) {
        pokemonBLBehavior = pokemonBL
    }
    
    override func buildUseCase(params: Int) -> Observable<DescriptionPokemonResponse> {
        
        return try! self.pokemonBLBehavior.getPoKemonDescription(idPokemon: params).retry(1).flatMap({
            (descriptionResponse) -> Observable<DescriptionPokemonResponse> in
            return Observable.just(descriptionResponse)
        })
    }
}

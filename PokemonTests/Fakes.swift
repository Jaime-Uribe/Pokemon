//
//  Fakes.swift
//  PokemonTests
//
//  Created by Jaime Uribe on 23/03/21.
//

import Foundation

class Fakes {
    
    static let pokemon = Pokemon(imagePokemon: nil,
                          powerName: "normal",
                          powerNameTwo: nil,
                          name:"ditto",
                          id: 132,
                          powerOne: nil,
                          powerTwo: nil,
                          moves: ["transform"],
                          abilities: ["limber", "imposter"],
                          imageURL: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/132.png")
    
    static let pokemonWithError = Pokemon(imagePokemon: nil,
                          powerName: "normal",
                          powerNameTwo: nil,
                          name:"ditto",
                          id: nil,
                          powerOne: nil,
                          powerTwo: nil,
                          moves: ["transform"],
                          abilities: ["limber", "imposter"],
                          imageURL: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/132.png")
    
    static func createError() -> Error {
        let error =  NSError(domain: "NSError", code: 404, userInfo: [NSLocalizedDescriptionKey: "Response status code was unacceptable: 401., NSUnderlyingError=0x2831b1d80 {Error Domain=Alamofire.AFError Code=3"])
        return error
    }
    
    init() {
    }
}

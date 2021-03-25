//
//  LikeViewController.swift
//  Pokemon
//
//  Created by Jaime Uribe on 24/01/21.
//

import UIKit
import NotificationBannerSwift
import CoreData

class LikeViewController: BaseViewController {
    
    //MARK: -IBOutlet
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var powerOneLabel: UILabel!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    
    
    
    //MARK: -IBAction
    @IBAction func returnButtonAction(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
        self.dismiss(animated: true)
    }
    
    @IBAction func likeButtonAction(_ sender: Any) {
        if pokemon.count > 0 {
            selectPokemonForSave()
            pokemon.removeFirst()
            setupUI()
        } else {
            NotificationBanner(title: "Don't have more pokemons for to see.", subtitle: "List is empty", style: .warning).show()
        }
        
    }
    
    @IBAction func dislikeAButtonAction(_ sender: Any) {
        if pokemon.count > 0 {
            setupUI()
            pokemon.removeFirst()
        } else {
            NotificationBanner(title: "Don't have more pokemons for to see.", subtitle: "List is empty", style: .warning).show()
        }
    }
    
    
    //MARK: -Propeeties
    var pokemon = [Pokemon]()
    private  var appDelegate = UIApplication.shared.delegate as? AppDelegate
    private let manager = CoreDataManager()
    private var countPokemon: Int = 0
    var savePokemonPresenter: InputPresenterSavePokemonType!

    override func viewDidLoad() {
        super.viewDidLoad()
        PokemonLikeRouter.createDetailPokemonView(reference: self)
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    func setupUI(){
        pokemonImageView.image = pokemon[0].imagePokemon
        pokemonNameLabel.text = pokemon[0].name
        powerOneLabel.text = pokemon[0].powerName
    }
    
    
    private func selectPokemonForSave(){
        savePokemonPresenter?.savePokemon(pokemon: pokemon[0])
    }
    

}

extension LikeViewController: OutputPresenterPokemonSavable{
    func onSavePokemonResponseSucess() {
        NotificationBanner(title: "Your pokemon has been save", subtitle: "Succelful", style: .success).show()
    }
    
    func onSavePokemonResponseFailed() {
        NotificationBanner(title: "We can´t save your pokemon", subtitle: "Warning", style: .warning).show()
    }
    
    
}

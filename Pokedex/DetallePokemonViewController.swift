//
//  DetallePokemonViewController.swift
//  Pokedex
//
//  Created by Sebastian Verastegui and Carlos Padilla 2024 August31
//

import UIKit

class DetallePokemonViewController: UIViewController {
    
    // MARK: - Variables
    var pokemonMostrar: Pokemon?
    
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var defensaPokemon: UILabel!
    @IBOutlet weak var ataquePokemon: UILabel!
    @IBOutlet weak var tipoPokemon: UILabel!
    @IBOutlet weak var imagenPokemon: UIImageView!
    @IBOutlet weak var descripcionPokemon: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //Imagen mostrar
        imagenPokemon.loadFrom(URLAddres: pokemonMostrar?.imageUrl ?? "")
        tipoPokemon.text = "Type : \(pokemonMostrar?.type ?? "")"
        ataquePokemon.text = "Attack: \(pokemonMostrar!.attack)"
        defensaPokemon.text = "Defense: \(pokemonMostrar!.defense)"
        descripcionPokemon.text = pokemonMostrar?.description ?? ""
        
    }
}


extension UIImageView {
    func loadFrom(URLAddres: String) {
        guard let url = URL(string: URLAddres) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data,
                  let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async { [weak self] in
                self?.image = image
            }
        }
        .resume()
    }
}

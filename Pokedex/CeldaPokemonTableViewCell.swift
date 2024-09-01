//
//  CeldaPokemonTableViewCell.swift
//  Pokedex
//
//  Created by Carlos Padilla and Sebastian Verastegui on 2024 August 31
//

import UIKit

class CeldaPokemonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var defensaPokemon: UILabel! // Etiqueta para mostrar la defensa del Pokémon
    @IBOutlet weak var ataquePokemon: UILabel! // Etiqueta para mostrar el ataque del Pokémon
    @IBOutlet weak var nombrePokemon: UILabel! // Etiqueta para mostrar el nombre del Pokémon
    @IBOutlet weak var imagenPokemon: UIImageView! // Imagen para mostrar el Pokémon
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imagenPokemon.layer.cornerRadius = 15 // Redondea las esquinas de la imagen del Pokémon
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Mantiene la configuración de la vista para el estado seleccionado
    }
    
}

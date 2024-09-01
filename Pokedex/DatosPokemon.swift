//
//  CeldaPokemonTableViewCell.swift
//  Pokedex
//
//  Created by Carlos Padilla and Sebastian Verastegui on 2024 August 31
//

import Foundation

struct Pokemon: Decodable, Identifiable {
    let id: Int
    let attack: Int
    let defense: Int
    let description: String
    var name: String
    let imageUrl: String
    let type: String
}

//
//  DatosPokemon.swift
//  Pokedex
//
//  Made by Carlos Padilla and Sebastian Verástegui on 2024 August 31.
//


import Foundation

struct Pokemon: Decodable, Identifiable {
    let id: Int
    let attack: Int
    let defense: Int
    let description: String
    let name: String
    let imageUrl: String
    let type: String
}

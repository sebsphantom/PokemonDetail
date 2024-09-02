//
//  PokemonManager.swift
//  Pokedex
//
//  Made by Carlos Padilla and Sebastian Verástegui on 2024 August 31.
//

import Foundation

protocol pokemonManagerDelegado {
    func mostrarListaPokemon(lista: [Pokemon])
}

struct PokemonManager {
    var delegado: pokemonManagerDelegado?
    
    func verPokemon() {
        // URL de la API que proporciona la lista de Pokémon
        let urlString = "https://pokedex-bb36f.firebaseio.com/pokemon.json"
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            // Tarea de sesión para obtener los datos de la API
            let tarea = session.dataTask(with: url) { datos, respuesta, error in
                if error != nil {
                    print("Error obtaining data from API: ", error?.localizedDescription)
                }
                
                // Procesa los datos seguros, eliminando cadenas no deseadas
                if let datosSeguros = datos?.parseData(quitarString: "null,") {
                    if let listaPokemon = self.parsearJSON(datosPokemon: datosSeguros) {
                        print("Pokémon List: ", listaPokemon)
                        
                        // Muestra la lista de Pokémon obtenida al delegado
                        delegado?.mostrarListaPokemon(lista: listaPokemon)
                    }
                }
            }
            
            // Inicia la tarea para obtener los datos
            tarea.resume()
        }
    }
    
    func parsearJSON(datosPokemon: Data) -> [Pokemon]? {
        // Decodifica los datos JSON recibidos a objetos Pokémon
        let decodificador = JSONDecoder()
        do {
            let datosDecodificados = try decodificador.decode([Pokemon].self, from: datosPokemon)
            return datosDecodificados
            
        } catch {
            print("Error decoding data: ", error.localizedDescription)
            return nil
        }
    }
}

extension Data {
    func parseData(quitarString palabra: String) -> Data? {
        // Convierte los datos a string y elimina la cadena no deseada
        let dataAsString = String(data: self, encoding: .utf8)
        let parseDataString = dataAsString?.replacingOccurrences(of: palabra, with: "")
        guard let data = parseDataString?.data(using: .utf8) else { return nil }
        return data
    }
}

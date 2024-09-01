//
//  PokemonManager.swift
//  Pokedex
//
//  Created by Carlos Padilla and Sebastian Verastegui on 2024 August 31
//

import Foundation

protocol pokemonManagerDelegado {
    func mostrarListaPokemon(lista: [Pokemon]) // Protocolo para mostrar la lista de Pokémon
}

struct PokemonManager {
    var delegado: pokemonManagerDelegado? // Propiedad para referenciar al delegado que maneja la lista de Pokémon
    
    func verPokemon() {
        let urlString = "https://pokedex-bb36f.firebaseio.com/pokemon.json" // URL de la API para obtener los datos de los Pokémon
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default) // Configura una sesión URL para obtener los datos
            
            let tarea = session.dataTask(with: url) { datos, respuesta, error in
                if error != nil {
                    print("Error fetching data from the API", error?.localizedDescription) // Muestra el error si no se pueden obtener los datos
                    return
                }
                
                if let datosSeguros = datos?.parseData(quitarString: "null,") { // Limpia los datos recibidos de caracteres no deseados
                    if let listaPokemon = self.parsearJSON(datosPokemon: datosSeguros) { // Convierte los datos JSON a una lista de Pokémon
                        print("Pokémon List: ", listaPokemon)
                        
                        delegado?.mostrarListaPokemon(lista: listaPokemon) // Informa al delegado con la lista de Pokémon obtenida
                    }
                }
            }
            
            tarea.resume() // Inicia la tarea para obtener los datos de la API
        }
    }
    
    func parsearJSON(datosPokemon: Data) -> [Pokemon]? {
        let decodificador = JSONDecoder() // Crea un decodificador JSON para convertir los datos
        
        do {
            var datosDecodificados = try decodificador.decode([Pokemon].self, from: datosPokemon) // Decodifica los datos JSON a objetos Pokémon
            
            // Capitaliza la primera letra del nombre de cada Pokémon
            datosDecodificados = datosDecodificados.map { pokemon in
                var pokemonModificado = pokemon
                pokemonModificado.name = pokemon.name.capitalizingFirstLetter()
                return pokemonModificado
            }
            
            return datosDecodificados // Devuelve la lista de Pokémon con nombres capitalizados
        } catch {
            print("Error decoding data: ", error.localizedDescription) // Muestra el error si la decodificación falla
            return nil
        }
    }
}

extension Data {
    func parseData(quitarString palabra: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8) // Convierte los datos a una cadena de texto
        let parseDataString = dataAsString?.replacingOccurrences(of: palabra, with: "") // Reemplaza caracteres no deseados en los datos
        guard let data = parseDataString?.data(using: .utf8) else { return nil } // Convierte la cadena de vuelta a datos
        return data // Devuelve los datos limpios
    }
}

// Extensión de String para capitalizar la primera letra
extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst() // Capitaliza la primera letra de la cadena
    }
}

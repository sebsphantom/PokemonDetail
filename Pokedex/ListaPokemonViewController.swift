//
//  ViewController.swift
//  Pokedex
//
//  Made by Carlos Padilla and Sebastian Verastegui on 2924 August 31.
//

import UIKit

class ListaPokemonViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var searchBarPokemon: UISearchBar!
    
    @IBOutlet weak var searchPokemonTextField: UITextField!
    
    @IBOutlet weak var tablaPokemon: UITableView!
    
    // MARK: - Variables
    var pokemonManager = PokemonManager()
    
    var pokemons: [Pokemon] = []
    
    var pekemonSeleccionado: Pokemon?
    
    var pokemonFiltrados: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Registra la celda personalizada en la tabla
        tablaPokemon.register(UINib(nibName: "CeldaPokemonTableViewCell", bundle: nil), forCellReuseIdentifier: "celda")
        
        pokemonManager.delegado = self
        
        /// **DEPRECADA **: Metodo anterior de búsqueda
//        searchBarPokemon.delegate = self
        searchPokemonTextField.delegate = self
        
        tablaPokemon.delegate = self
        tablaPokemon.dataSource = self
        
        // Ejecuta la función para obtener la lista de Pokémon
        pokemonManager.verPokemon()
    }
}

// MARK: - SearchBar
/// **DEPRECADA **: Extensión del delegado de UISearchBar
//extension ListaPokemonViewController: UISearchBarDelegate {
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//
//        pokemonFiltrados = []
//
//        if searchText == "" {
//            pokemonFiltrados = pokemons
//        } else {
//            for poke in pokemons {
//                if poke.name.lowercased().contains(searchText.lowercased()) {
//                    pokemonFiltrados.append(poke)
//                }
//            }
//        }
//
//        self.tablaPokemon.reloadData()
//
//    }
//}

extension ListaPokemonViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        // Filtra la lista de Pokémon según el texto ingresado
        pokemonFiltrados = []
        
        if textField.text == "" {
            pokemonFiltrados = pokemons
        } else {
            for poke in pokemons {
                if poke.name.lowercased().contains(textField.text!) {
                    pokemonFiltrados.append(poke)
                }
            }
        }
        self.tablaPokemon.reloadData()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Oculta el teclado cuando se presiona "return"
        textField.endEditing(true)
        return true
    }
}

// MARK: - Delegado Pokemon
extension ListaPokemonViewController: pokemonManagerDelegado {
    func mostrarListaPokemon(lista: [Pokemon]) {
        // Actualiza la lista de Pokémon y recarga la tabla en la interfaz principal
        pokemons = lista
        
        DispatchQueue.main.async {
            self.pokemonFiltrados = lista
            self.tablaPokemon.reloadData()
        }
    }
}

// MARK: - Tabla
extension ListaPokemonViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Devuelve el número de Pokémon filtrados para mostrar
        return pokemonFiltrados.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configura cada celda de la tabla con los datos del Pokémon
        let celda = tablaPokemon.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! CeldaPokemonTableViewCell
        
        celda.nombrePokemon.text = pokemonFiltrados[indexPath.row].name
        celda.ataquePokemon.text = "Attack: \(pokemonFiltrados[indexPath.row].attack)"
        celda.defensaPokemon.text = "Defense: \(pokemonFiltrados[indexPath.row].defense)"
        
        // Carga la imagen del Pokémon desde una URL
        if let urlString = pokemonFiltrados[indexPath.row].imageUrl as? String {
            if let imagenURL = URL(string: urlString) {
                DispatchQueue.global().async {
                    guard let imagenData = try? Data(contentsOf: imagenURL) else { return }
                    let image = UIImage(data: imagenData)
                    DispatchQueue.main.async {
                        celda.imagenPokemon.image = image
                    }
                }
            }
        }
        
        return celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Guarda el Pokémon seleccionado y navega a la pantalla de detalles
        pekemonSeleccionado = pokemonFiltrados[indexPath.row]
        
        performSegue(withIdentifier: "verPokemon", sender: self)
        
        // Deselecciona la fila después de seleccionar
        tablaPokemon.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Prepara los datos para la vista de detalles del Pokémon
        if segue.identifier == "verPokemon" {
            let verPokemon = segue.destination as! DetallePokemonViewController
            verPokemon.pokemonMostrar = pekemonSeleccionado
        }
    }
}

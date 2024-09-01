import UIKit

class ListaPokemonViewController: UIViewController {

    // MARK: - IBOutlets // Conexión con elementos de la interfaz
    @IBOutlet weak var searchBarPokemon: UISearchBar! // Barra de búsqueda (obsoleta)
    @IBOutlet weak var searchPokemonTextField: UITextField! // Campo de texto para buscar
    @IBOutlet weak var tablaPokemon: UITableView! // Tabla que muestra la lista de Pokémon

    // MARK: - Variables // Datos para manejar los Pokémon
    var pokemonManager = PokemonManager() // Objeto para gestionar la lista de Pokémon
    var pokemons: [Pokemon] = [] // Lista completa de Pokémon
    var pekemonSeleccionado: Pokemon? // Pokémon seleccionado por el usuario
    var pokemonFiltrados: [Pokemon] = [] // Lista de Pokémon filtrados por la búsqueda

    override func viewDidLoad() {
        super.viewDidLoad()

        // Registrar la celda personalizada para la tabla
        tablaPokemon.register(UINib(nibName: "CeldaPokemonTableViewCell", bundle: nil), forCellReuseIdentifier: "celda")

        // Configurar delegados para manejar eventos
        pokemonManager.delegado = self
        searchPokemonTextField.delegate = self
        tablaPokemon.delegate = self
        tablaPokemon.dataSource = self

        // Obtener la lista de Pokémon
        pokemonManager.verPokemon()
    }
}

// MARK: - TextField // Manejo de la búsqueda por texto
extension ListaPokemonViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        // Filtrar Pokémon al cambiar el texto
        pokemonFiltrados = []
        if textField.text == "" {
            pokemonFiltrados = pokemons // Mostrar todos si el campo está vacío
        } else {
            // Filtrar por nombre si hay texto
            for poke in pokemons {
                if poke.name.lowercased().contains(textField.text!) {
                    pokemonFiltrados.append(poke)
                }
            }
        }
        self.tablaPokemon.reloadData() // Actualizar la tabla
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Ocultar el teclado al presionar Enter
        textField.endEditing(true)
        return true
    }
}

// Recibir la lista de Pokémon
extension ListaPokemonViewController: pokemonManagerDelegado {
    func mostrarListaPokemon(lista: [Pokemon]) {
        pokemons = lista

        DispatchQueue.main.async { // Actualizar la interfaz en el hilo principal
            self.pokemonFiltrados = lista
            self.tablaPokemon.reloadData()
        }
    }
}

// Configuración de la tabla
extension ListaPokemonViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Número de filas en la tabla (según los Pokémon filtrados)
        return pokemonFiltrados.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configurar cada celda de la tabla
        let celda = tablaPokemon.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! CeldaPokemonTableViewCell

        // Mostrar datos del Pokémon en la celda
        celda.nombrePokemon.text = pokemonFiltrados[indexPath.row].name
        celda.ataquePokemon.text = "Attack: \(pokemonFiltrados[indexPath.row].attack)"
        celda.defensaPokemon.text = "Defense: \(pokemonFiltrados[indexPath.row].defense)"

        // Cargar imagen del Pokémon desde la URL (si existe)
        if let urlString = pokemonFiltrados[indexPath.row].imageUrl as? String {
            if let imagenURL = URL(string: urlString) {
                DispatchQueue.global().async { // Descargar imagen en segundo plano
                    guard let imagenData = try? Data(contentsOf: imagenURL) else { return }
                    let image = UIImage(data: imagenData)
                    DispatchQueue.main.async { // Mostrar imagen en el hilo principal
                        celda.imagenPokemon.image = image
                    }
                }
            }
        }

        return celda
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Guardar el Pokémon seleccionado al tocar una fila
        pekemonSeleccionado = pokemonFiltrados[indexPath.row]

        // Navegar a la pantalla de detalle
        performSegue(withIdentifier: "verPokemon", sender: self)

        // Deseleccionar la fila
        tablaPokemon.deselectRow(at: indexPath, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Pasar el Pokémon seleccionado a la pantalla de detalle
        if segue.identifier == "verPokemon" {
            let verPokemon = segue.destination as! DetallePokemonViewController
            verPokemon.pokemonMostrar = pekemonSeleccionado
        }
    }
}

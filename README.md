### `README.md`
# Pokedex App

![Pokemon GIF](https://github.com/sebsphantom/PokemonDetail/raw/main/pokemon.gif)

## Overview

Pokedex App is an iOS application that provides a detailed list of Pokémon with their respective stats, images, and descriptions. Users can search for their favorite Pokémon using a search bar, view their stats, and access detailed information about each Pokémon. The app uses a custom table view to display the list and implements image caching for efficient loading.

## Features

- **Search Functionality:** Quickly search for any Pokémon by name using the search bar.
- **Pokémon Details:** View detailed information such as name, attack, and defense stats.
- **Image Loading and Caching:** Optimized image loading with caching to enhance performance and reduce network calls.
- **Custom Table View:** A custom table view cell is used to display Pokémon details, including images and stats.

## Screenshots

![App Screenshot](https://github.com/sebsphantom/PokemonDetail/raw/main/pokemon.gif)

## Getting Started

### Prerequisites

- iOS 13.0+
- Xcode 12.0+
- Swift 5.0+

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/sebsphantom/PokemonDetail.git
   ```

2. Open the project in Xcode:

   ```bash
   cd PokemonDetail
   open Pokedex.xcodeproj
   ```

3. Build and run the project on your simulator or connected device.

### Usage

- Use the search bar to filter Pokémon by name.
- Tap on a Pokémon to view its detailed stats and information.

## Code Structure

- **`ListPokemonViewController.swift`**: Handles the display of the Pokémon list and manages the search functionality.
- **`DetallePokemonViewController.swift`**: Displays detailed information about the selected Pokémon.
- **`CeldaPokemonTableViewCell.swift`**: Custom table view cell to display Pokémon details, including name, stats, and image.

## Contributing

Contributions are welcome! Please fork the repository, make your changes, and submit a pull request.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Thanks to the Pokémon API for providing the data and images.
- Inspired by the original Pokémon series and games.

---

Feel free to customize this `README.md` with additional information or any other specific instructions for your project!

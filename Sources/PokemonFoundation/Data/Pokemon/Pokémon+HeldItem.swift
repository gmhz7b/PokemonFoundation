import Foundation
import CodableExtensions

extension Pokémon {
    
    /// An item a Pokémon may be holding when encountered.
    ///
    /// See [PokéAPI documentation](https://pokeapi.co/docs/v2#pokemonhelditem) for details.
    public struct HeldItem: Codable, HasJSONDecoder {
        
        /// The item the referenced Pokémon holds.
        ///
        /// See [PokéAPI documentation](https://pokeapi.co/docs/v2#item)
        /// for details.
        public let item: NamedAPIResource?
        
        /// The details of the different versions in which the item is held.
        public let versionDetails: [HeldItem.Version]?
    }
}

extension Pokémon.HeldItem {
        
    /// Pokemon Held Item Version.
    ///
    /// See [PokéAPI documentation](https://pokeapi.co/docs/v2#pokemonhelditemversion) for details.
    public struct Version: Codable {
        
        /// The version in which the item is held.
        ///
        /// See [PokéAPI documentation](https://pokeapi.co/docs/v2#version)
        /// for details.
        public let version: NamedAPIResource?
        
        /// How often the item is held.
        public let rarity: Int?
    }
}

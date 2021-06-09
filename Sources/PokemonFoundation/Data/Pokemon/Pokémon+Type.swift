import Foundation
import CodableExtensions

extension Pokémon {
    
    /// Details about the type of a Pokémon.
    ///
    /// See [PokéAPI documentation](https://pokeapi.co/docs/v2#pokemontype) for details.
    public struct `Type`: Codable {
        
        /// The order the Pokémon's types are listed in.
        public let slot: Int?
        
        /// The type the referenced Pokémon has.
        ///
        /// See [PokéAPI documentation](https://pokeapi.co/docs/v2#type)
        /// for details.
        public let type: NamedAPIResource?
    }
}

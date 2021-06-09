import Foundation
import CodableExtensions

extension Pokémon {
    
    /// A base stat value for a Pokémon.
    ///
    /// See [PokéAPI documentation](https://pokeapi.co/docs/v2#pokemonstat) for details.
    public struct Stat: Codable, HasJSONDecoder {
        
        /// The stat the Pokémon has.
        ///
        /// See [PokéAPI documentation](https://pokeapi.co/docs/v2#stat)
        /// for details.
        public let stat: NamedAPIResource?
        
        /// The effort points (EV) the Pokémon has in the stat.
        public let effort: Int?
        
        /// The base value of the stat.
        public let baseStat: Int?
    }
}

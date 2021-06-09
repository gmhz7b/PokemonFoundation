import Foundation
import CodableExtensions

extension Pokémon {
    
    /// An ability that a Pokémon could potentially have.
    ///
    /// See [PokéAPI documentation](https://pokeapi.co/docs/v2#pokemonability) for details.
    public struct Ability: Codable, HasJSONDecoder {
        
        /// Whether or not this is a hidden ability.
        public let isHidden: Bool?
        
        /// The slot this ability occupies in this Pokémon species.
        public let slot: Int?
        
        /// The ability the Pokémon may have
        ///
        /// See [PokéAPI documentation](https://pokeapi.co/docs/v2#ability)
        /// for details.
        public let ability: NamedAPIResource?
    }
}

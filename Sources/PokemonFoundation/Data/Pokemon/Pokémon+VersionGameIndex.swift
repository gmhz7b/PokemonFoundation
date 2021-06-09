import Foundation
import CodableExtensions

extension Pokémon {
    
    /// A  game index relevent to Pokémon item by generation.
    ///
    /// See [PokéAPI documentation](https://pokeapi.co/docs/v2#versiongameindex) for details.
    public struct VersionGameIndex: Codable, HasJSONDecoder {
        
        /// The internal id of an API resource within game data.
        public let gameIndex: Int?
        
        /// The version relevent to this game index.
        ///
        /// See [PokéAPI documentation](https://pokeapi.co/docs/v2#version)
        /// for details.
        public let version: NamedAPIResource?
    }
}

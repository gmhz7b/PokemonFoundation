import Foundation
import CodableExtensions

extension Pokémon {
    
    /// A move a Pokémon can learn.
    ///
    /// See [PokéAPI documentation](https://pokeapi.co/docs/v2#pokemonmove) for details.
    public struct Move: Codable, HasJSONDecoder {
        
        /// The move the Pokémon can learn.
        ///
        /// See [PokéAPI documentation](https://pokeapi.co/docs/v2#move)
        /// for details.
        public let move: NamedAPIResource?
        
        /// The details of the version in which the Pokémon can learn the move.
        public let versionGroupDetails: [Move.Version]?
    }
}

extension Pokémon.Move {
    
    /// Pokemon Move Version.
    ///
    /// See [PokéAPI documentation](https://pokeapi.co/docs/v2#pokemonmoveversion) for details.
    public struct Version: Codable, HasJSONDecoder {
        
        /// The method by which the move is learned.
        ///
        /// See [PokéAPI documentation](https://pokeapi.co/docs/v2#movelearnmethod)
        /// for details.
        public let moveLearnMethod: NamedAPIResource?
        
        /// The version group in which the move is learned.
        ///
        /// See [PokéAPI documentation](https://pokeapi.co/docs/v2#versiongroup)
        /// for details.
        public let versionGroup: NamedAPIResource?
        
        /// The version group in which the move is learned.
        public let levelLearnedAt: Int?
    }
}

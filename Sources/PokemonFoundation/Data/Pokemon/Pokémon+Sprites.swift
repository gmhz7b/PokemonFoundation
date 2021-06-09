import Foundation

import CodableExtensions

extension Pokémon {
    
    /// A set of sprites used to depict this Pokémon in the game.
    ///
    /// See [PokéAPI documentation](https://pokeapi.co/docs/v2#pokemonsprites) for details.
    public class Sprites: Codable, HasJSONDecoder {
        
        /// The default depiction of this Pokémon from the front in battle.
        public let frontDefault: URL?
        
        /// The shiny depiction of this Pokémon from the front in battle.
        public let frontShiny: URL?
        
        /// The female depiction of this Pokémon from the front in battle.
        public let frontFemale: URL?
        
        /// The shiny female depiction of this Pokémon from the front.
        public let frontShinyFemale: URL?
        
        /// The default depiction of this Pokémon from the back in battle.
        public let backDefault: URL?
        
        /// The shiny depiction of this Pokémon from the back in battle.
        public let backShiny: URL?
        
        /// The female depiction of this Pokémon from the back in battle.
        public let backFemale: URL?
        
        /// The shiny female depiction of this Pokémon from the back in battle.
        public let backShinyFemale: URL?
        
        /// GIF depictions of a Pokémon
        public let animated: Pokémon.Sprites?
        
        /// Special-event depictions.
        public let other: [String: Pokémon.Sprites]?
        
        /// Version-specific depictions.
        public let versions: [String: [String: Pokémon.Sprites]]?
    }
}

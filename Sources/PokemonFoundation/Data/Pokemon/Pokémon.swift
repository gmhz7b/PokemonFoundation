import Foundation
import CodableExtensions

/// Pokémon are the creatures that inhabit the world of the Pokémon games.
/// They can be caught using Pokéballs and trained by battling with other Pokémon.
///
/// See [PokéAPI documentation](https://pokeapi.co/docs/v2#pokemon)
/// for details.
public struct Pokémon: Codable, HasJSONDecoder {
    
    /// The identifier for this Pokémon resource.
    public let id: Int?
    
    /// The name for this Pokémon resource.
    public let name: String?
    
    /// The base experience gained for defeating this Pokémon.
    public let baseExperience: Int?
    
    /// The height of this Pokémon.
    public let height: Int?
    
    /// Set for exactly one Pokémon used as the default for each species.
    public let isDefault: Bool?
    
    /// Order for sorting. Almost national order, except families are grouped together.
    public let order: Int?
    
    /// The weight of this Pokémon.
    public let weight: Int?
    
    /// A list of abilities this Pokémon could potentially have.
    public let abilities: [Pokémon.Ability]?
    
    /// A list of forms this Pokémon can take on.
    ///
    /// See [PokéAPI documentation](https://pokeapi.co/docs/v2#pokemon-forms)
    /// for details.
    public let forms: [NamedAPIResource]?
    
    /// A list of game indices relevent to Pokémon item by generation.
    public let gameIndices: [Pokémon.VersionGameIndex]?
    
    /// A list of items this Pokémon may be holding when encountered.
    public let heldItems: [Pokémon.HeldItem]?
    
    /// A list of location areas as well as encounter details pertaining to specific versions.
    public let locationAreaEncounters: URL?
    
    /// A list of moves along with learn methods and level details pertaining to specific version groups.
    public let moves: [Pokémon.Move]?
    
    /// A set of sprites used to depict this Pokémon in the game.
    public let sprites: Pokémon.Sprites?
    
    /// The species this Pokémon belongs to.
    ///
    /// See [PokéAPI documentation](https://pokeapi.co/docs/v2#pokemon-species)
    /// for details.
    public let species: NamedAPIResource?
    
    /// A list of base stat values for this Pokémon.
    public let stats: [Pokémon.Stat]?
    
    /// A list of details showing types this Pokémon has.
    public let types: [Pokémon.`Type`]?
    
    /// Primary display text.
    public var displayName: String {
        return name?
            .split(separator: "-")
            .map { String($0).capitalized }
            .joined(separator: "-")
            ?? Bundle.module.localizedString(forKey: "display-name.not-available.text", comment: nil)
    }
}

import Foundation
import CodableExtensions

/// API Referenced Resource.
///
/// See [PokéAPI documentation](https://pokeapi.co/docs/v2#apiresource) for details.
public class APIResource: Codable {

    /// The URL of the referenced resource.
    public let url: URL?
    
    public init(url: URL?) {
        self.url = url
    }
}

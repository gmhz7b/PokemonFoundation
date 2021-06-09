import Foundation
import CodableExtensions

/// Named API Resource.
///
/// See [PokéAPI documentation](https://pokeapi.co/docs/v2#namedapiresource) for details.
public class NamedAPIResource: APIResource {
    
    /// The name of the referenced resource.
    public let name: String?
    
    public init(name: String?, url: URL?) {
        self.name = name
        
        super.init(url: url)
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        
        try super.init(from: decoder)
    }
}

extension NamedAPIResource {
    
    private enum CodingKeys: String, CodingKey {
        case name
    }
}

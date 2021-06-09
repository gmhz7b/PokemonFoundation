import Foundation

import CommonKit

/// Object used to display a list of Pokémon.
public struct Pokédex: Codable {
    
    /// A list of `Pokémon` available for download from `PokéAPI`.
    public let entries: [Entry]
    
    private enum CodingKeys: String, CodingKey {
        case entries = "results"
    }
}

extension Pokédex {
    
    /// A convenience class for parsing and utilizing data return from `PokéAPI`.
    ///
    /// Derived from `NamedAPIResource`.
    ///
    /// - SeeAlso: `Searchable`.
    /// - SeeAlso: `NamedAPIResource`.
    public final class Entry: Codable, Searchable {
        
        /// The name of the referenced entry.
        public let name: String
        
        /// The URL of the referenced resource.
        public let url: URL
        
        @objc public var identifier: String { name }
        
        /// Convenience computed var for displaying the list item in a `UITableView`.
        public var displayText: String {
            return name
                .split(separator: "-")
                .map { String($0).capitalized }
                .joined(separator: "-")
        }
        
        public static func == (lhs: Pokédex.Entry, rhs: Pokédex.Entry) -> Bool {
            return lhs.name == rhs.name && lhs.url == rhs.url
        }
    }
}

import Foundation
import UIKit

import CommonKit

extension Pokémon.Sprites {
    
    func groups(prefix: String? = nil) -> [FetchGroup] {
        let selfGroups = [FetchGroup(id: prefix, urls: urls)]
        
        let animatedGroups = animated?
            .groups(prefix: [prefix, Constant.animated].formattedForDisplay())
            ?? []
        
        let otherGroups = other?.groups(prefix: prefix) ?? []
        
        let versionGroups = versions?
            .map { $0.value.groups(prefix: [prefix, $0.key].formattedForDisplay()) }
            .flatMap { $0 }
            ?? []
        
        return selfGroups + animatedGroups + otherGroups + versionGroups
    }
}

extension Pokémon.Sprites {
    
    private var urls: [URL] {
        return [
            frontDefault,
            frontShiny,
            frontFemale,
            frontShinyFemale,
            backDefault,
            backShiny,
            backFemale,
            backShinyFemale
        ]
        .compactMap { $0 }
        .filter { !$0.absoluteString.contains(Constant.svg) }
    }
}

extension Pokémon.Sprites {
    
    public struct DisplayGroup {
        
        /// An identifier for the `DisplayGroup`.
        public let id: String
        
        /// A collection of `Data`s associated to the `DisplayGroup`.
        ///
        /// Each element of the collection represents a single sprite depiction.
        public let imagesData: [Data]
        
        /// The `UIImage`s associated to the `DisplayGroup`.
        public var images: [UIImage] {
            
            return imagesData.compactMap {
                id.contains(Constant.animated)
                    ? GIFFactory().gif(from: $0)
                    : UIImage(data: $0)
            }
        }
        
        public var isPrimary: Bool { id == Constant.primary }
        
        public init(id: String?, imagesData: [Data]) {
            self.id = id ?? Constant.primary
            self.imagesData = imagesData
        }
    }
}

extension Pokémon.Sprites {
    
    struct FetchGroup {
        
        /// An identifier for the `FetchGroup`.
        public let id: String?
        
        
        /// A collection of `URL`s associated to the `FetchGroup`.
        public let urls: [URL]
    }
    
    private enum Constant {
        
        static var primary: String { "Primary" }
        
        static var animated: String { "Animated" }
        
        static var svg: String { "svg" }
    }
}

extension Dictionary where Key == String, Value == Pokémon.Sprites {
    
    fileprivate func groups(prefix: String? = nil) -> [Pokémon.Sprites.FetchGroup] {
        
        let allGroups: [[Pokémon.Sprites.FetchGroup]] = map {
            $0.value.groups(prefix: [prefix, $0.key].formattedForDisplay())
        }
        
        return allGroups.flatMap { $0 }
    }
}

extension Array where Element == String? {
    
    fileprivate func formattedForDisplay() -> String? {
        
        return compactMap { $0?.formattedForDisplay() }.joined(separator: " ").nilIfEmpty
    }
}

extension String {
    
    fileprivate func formattedForDisplay() -> String? {
        let numerals = ["i", "ii", "iii", "iv", "v", "vi", "vii", "viii", "ix"]
                
        return components(separatedBy: CharacterSet(charactersIn: "- "))
            .map { numerals.contains($0.lowercased()) ? $0.uppercased() : $0.capitalized }
            .filter { !$0.isEmpty }
            .joined(separator: " ")
            .nilIfEmpty
    }
}

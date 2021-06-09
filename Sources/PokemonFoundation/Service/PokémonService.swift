import Foundation
import Combine

import ServiceKit

public final class PokémonService {
    
    private let baseURL: URL
    private let serviceClient: ServiceClientProtocol
    private let urlProvider: URLProviderProtocol
    
    init(baseURL: URL, serviceClient: ServiceClientProtocol, urlProvider: URLProviderProtocol) {
        self.baseURL = baseURL
        self.serviceClient = serviceClient
        self.urlProvider = urlProvider
    }
}

extension PokémonService {
        
    /// A method to provide a a configured instance of `PokémonService`.
    public static func instance() -> PokémonService? {
        guard let baseURL = Self.baseURL() else {
            return nil
        }
        
        return PokémonService(
            baseURL: baseURL,
            serviceClient: ServiceClient(),
            urlProvider: URLProvider()
        )
    }
}

extension PokémonService {
    
    /// Publishes a fetched `Pokédex` object from PokéAPI.
    public func pokédexPublisher() -> AnyPublisher<Pokédex, Error> {
        let url = urlProvider.url(
            for: baseURL,
            pathComponents: [PathComponent.pokemon],
            parameters: [
                Parameter.offset.key: "0",
                Parameter.limit.key: "1118"
            ]
        )
        
        return serviceClient.get(from: url)
    }
    
    /// Publishes a fetched `Pokémon` object from PokéAPI.
    public func pokémonPublisher(for url: URL) -> AnyPublisher<Pokémon, Error> {
        
        return serviceClient.get(from: url)
    }
    
    /// Publishes all sprites for  a`Pokémon` object fetched from PokéAPI.
    public func publisher(
        for sprites: Pokémon.Sprites
    ) -> AnyPublisher<[Pokémon.Sprites.DisplayGroup], Error> {
        let publishers = sprites.groups().map { publisher(for: $0) }
        
        return Publishers.MergeMany(publishers).collect().eraseToAnyPublisher()
    }
}

extension PokémonService {
    
    private func publisher(for group: Pokémon.Sprites.FetchGroup) -> AnyPublisher<Pokémon.Sprites.DisplayGroup, Error> {
        let publishers = group.urls.map { serviceClient.getJSONData(from: $0) }
        
        return Publishers.MergeMany(publishers)
            .collect()
            .map { Pokémon.Sprites.DisplayGroup(id: group.id, imagesData: $0) }
            .eraseToAnyPublisher()
    }
}

extension PokémonService {
    
    private static func baseURL() -> URL? {
        guard let urlString: String = Bundle.module
                .value(forKey: Constant.pokeAPIURLKey, inPlistNamed: Constant.urlPlistFileName)
        else {
            return nil
        }
        
        return URL(string: urlString)
    }
 
    private enum Constant {
        
        static var urlPlistFileName: String { "URLs" }
        static var pokeAPIURLKey: String { "PokéAPIURL" }
    }
    
    private enum PathComponent {
        
        static var pokemon: String { "pokemon" }
    }
    
    private enum Parameter: String {
        case offset
        case limit
        
        var key: String { rawValue }
    }
}

import Foundation
import Combine

import CodableExtensions
import ServiceKit

extension ServiceClientProtocol {
    
    /// A generic method to specify a `Decodable` type to be parsed from a service call.
    func get<T: Decodable>(from url: URL, headers: [String: String] = [:]) -> AnyPublisher<T, Swift.Error> {
        
        return publisher(for: .get, to: url, withBody: nil, headers: headers, contentType: .json)
            .jsonDecode(T.self)
            .eraseToAnyPublisher()
    }
    
    /// A wrapper around `publisher(for:, to:, withBody:, headers:, contentType:)` that supplies defaults.
    func getJSONData(from url: URL) -> AnyPublisher<Data, Swift.Error> {
        
        return publisher(for: .get, to: url, withBody: nil, headers: [:], contentType: .json)
    }
}

//
//  NetworkService.swift
//  CountryExplorer
//
//  Created by Maria julieta Rabozzi orelo on 07/07/2025.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetch<T: Decodable>(_ endpoint: APIEndpoint, as type: T.Type) async throws -> T
}

class NetworkService: NetworkServiceProtocol {
    func fetch<T: Decodable>(_ endpoint: APIEndpoint, as type: T.Type) async throws -> T {
        guard let url = endpoint.url else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(T.self, from: data)
    }
}

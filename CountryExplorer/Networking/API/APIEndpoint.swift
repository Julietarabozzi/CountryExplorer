//
//  APIEndpoint.swift
//  CountryExplorer
//
//  Created by Maria julieta Rabozzi orelo on 07/07/2025.
//

import Foundation

protocol APIEndpoint {
    var baseURL: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
}

extension APIEndpoint {
    var url: URL? {
        var components = URLComponents(string: baseURL)
        components?.path += path
        components?.queryItems = queryItems
        return components?.url
    }
}

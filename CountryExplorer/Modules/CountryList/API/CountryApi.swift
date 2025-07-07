//
//  CountryApi.swift
//  CountryExplorer
//
//  Created by Maria julieta Rabozzi orelo on 07/07/2025.
//

import Foundation

enum CountryAPI: APIEndpoint {
    case allCountries(fields: [String])

    var baseURL: String { "https://restcountries.com" }

    var path: String {
        switch self {
        case .allCountries: return "/v3.1/all"
        }
    }

    var queryItems: [URLQueryItem] {
        switch self {
        case .allCountries(let fields):
            return [URLQueryItem(name: "fields", value: fields.joined(separator: ","))]
        }
    }
}

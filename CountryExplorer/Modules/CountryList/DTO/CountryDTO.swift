//
//  CountryDTO.swift
//  CountryExplorer
//
//  Created by Maria julieta Rabozzi orelo on 07/07/2025.
//

import Foundation
struct CountryDTO: Decodable {
    let name: Name
    let capital: [String]?
    let flags: Flags
    let cca3: String

    struct Name: Decodable {
        let common: String
        let official: String
    }

    struct Flags: Decodable {
        let png: String
    }

    func toDomain() -> Country {
        Country(
            id: cca3,
            name: name.common,
            officialName: name.official,
            capital: capital?.first ?? "No capital",
            flagURL: flags.png
        )
    }
}

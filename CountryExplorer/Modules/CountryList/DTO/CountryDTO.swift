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
    let coatOfArms: CoatOfArms?
    let cca3: String
    let region: String?
    let subregion: String?
    let population: Int?
    let timezones: [String]?
    let languages: [String: String]?
    let currencies: [String: CurrencyInfo]?
    let car: Car?

    struct Name: Decodable {
        let common: String
        let official: String
    }

    struct Flags: Decodable {
        let png: String
    }

    struct CoatOfArms: Decodable {
        let png: String?
    }

    struct CurrencyInfo: Decodable {
        let name: String
        let symbol: String?
    }

    struct Car: Decodable {
        let side: String?
    }
    
    func toDomain() -> Country {
        Country(
            id: cca3,
            name: name.common,
            officialName: name.official,
            capital: capital?.first ?? "No capital",
            region: region ?? "Unknown",
            subregion: subregion ?? "Unknown",
            population: population ?? 0,
            timezones: timezones ?? [],
            languages: languages?.map { $0.value } ?? [],
            currencies: currencies?.map {
                let name = $0.value.name
                let symbol = $0.value.symbol ?? ""
                return "\(symbol) \(name)"
            } ?? [],
            carSide: car?.side ?? "right",
            flagURL: flags.png,
            coatOfArmsURL: coatOfArms?.png ?? ""
        )
    }
}

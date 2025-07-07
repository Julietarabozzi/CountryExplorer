//
//  CountryModel.swift
//  CountryExplorer
//
//  Created by Maria julieta Rabozzi orelo on 05/07/2025.
//

import Foundation
struct Country: Identifiable, Hashable {
    var id: String
    var name: String
    var officialName: String
    var capital: String
    var region: String
    var subregion: String
    var population: Int
    var timezones: [String]
    var languages: [String]
    var currencies: [String]
    var carSide: String
    var flagURL: String
    var coatOfArmsURL: String
}

extension Country {
    init(from favorite: CountryFavorite) {
        self.init(
            id: favorite.id,
            name: favorite.name,
            officialName: favorite.officialName,
            capital: favorite.capital,
            region: favorite.region,
            subregion: favorite.subregion,
            population: favorite.population,
            timezones: favorite.timezones,
            languages: favorite.languages,
            currencies: favorite.currencies,
            carSide: favorite.carSide,
            flagURL: favorite.flagURL,
            coatOfArmsURL: favorite.coatOfArmsURL
        )
    }
}

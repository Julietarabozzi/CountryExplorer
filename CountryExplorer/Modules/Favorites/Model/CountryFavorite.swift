//
//  CountryFavorite.swift
//  CountryExplorer
//
//  Created by Maria julieta Rabozzi orelo on 07/07/2025.
//

import Foundation
import SwiftData

@Model
class CountryFavorite {
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

    init(
        id: String,
        name: String,
        officialName: String,
        capital: String,
        region: String,
        subregion: String,
        population: Int,
        timezones: [String],
        languages: [String],
        currencies: [String],
        carSide: String,
        flagURL: String,
        coatOfArmsURL: String
    ) {
        self.id = id
        self.name = name
        self.officialName = officialName
        self.capital = capital
        self.region = region
        self.subregion = subregion
        self.population = population
        self.timezones = timezones
        self.languages = languages
        self.currencies = currencies
        self.carSide = carSide
        self.flagURL = flagURL
        self.coatOfArmsURL = coatOfArmsURL
    }
}
extension CountryFavorite {
    convenience init(from country: Country) {
        self.init(
            id: country.id,
            name: country.name,
            officialName: country.officialName,
            capital: country.capital,
            region: country.region,
            subregion: country.subregion,
            population: country.population,
            timezones: country.timezones,
            languages: country.languages,
            currencies: country.currencies,
            carSide: country.carSide,
            flagURL: country.flagURL,
            coatOfArmsURL: country.coatOfArmsURL
        )
    }
}

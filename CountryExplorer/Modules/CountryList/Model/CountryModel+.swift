//
//  CountryModel+.swift
//  CountryExplorer
//
//  Created by Maria julieta Rabozzi orelo on 24/07/2025.
//

import Foundation

extension Country {
    var populationFormatted: String {
        NumberFormatter.localizedString(from: NSNumber(value: population), number: .decimal)
    }

    var joinedLanguages: String {
        languages.joined(separator: ", ")
    }

    var joinedCurrencies: String {
        currencies.joined(separator: ", ")
    }

    var joinedTimezones: String {
        timezones.joined(separator: ", ")
    }

    var isRightHandDriving: Bool {
        carSide.lowercased() == "right"
    }
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

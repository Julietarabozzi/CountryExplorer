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

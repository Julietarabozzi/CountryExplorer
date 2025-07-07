//
//  CountryDetailViewModel.swift
//  CountryExplorer
//
//  Created by Maria julieta Rabozzi orelo on 07/07/2025.
//

import Foundation
import SwiftUI

class CountryDetailViewModel: ObservableObject {
    let country: Country
    
    init(country: Country) {
        self.country = country
    }
    
    var populationFormatted: String {
        NumberFormatter.localizedString(from: NSNumber(value: country.population), number: .decimal)
    }
    
    var joinedTimezones: [String] {
        country.timezones
    }
    
    var joinedLanguages: String {
        country.languages.joined(separator: ", ")
    }
    
    var joinedCurrencies: String {
        country.currencies.joined(separator: ", ")
    }
    
    var isRightHandDriving: Bool {
        country.carSide.lowercased() == "right"
    }
}

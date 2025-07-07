//
//  Strings+.swift
//  CountryExplorer
//
//  Created by Maria julieta Rabozzi orelo on 06/07/2025.
//

import Foundation
import Foundation

extension String {
    static var savedTitle: String { "🚨saved".localized }
    static var searchTitle: String { "🚨search".localized }
    
    //info card
    static var regionTitle: String { "🚨region".localized }
    static var subregionTitle: String { "🚨subregion".localized }
    static var capitalTitle: String { "🚨capital".localized }
    static var timezoneTitle: String { "🚨timezones".localized }
    static var populationTitle: String { "🚨population".localized }
    static var languagesTitle: String { "🚨languages".localized }
    static var currenciesTitle: String { "🚨currencies".localized }
    static var carSideTitle: String { "🚨carSide".localized }
    static var leftDrive: String { "🚨left".localized }
    static var rightDrive: String { "🚨right".localized }
    static var coatOfArmsTitle: String { "🚨coat_of_arms".localized }
    static var selectLanguajeTitle: String { "🚨selectLanguaje".localized }
}

extension String {
    var localized: String {
        let languageCode = LanguageManager.shared.currentLanguage.rawValue
        
        guard let path = Bundle.main.path(forResource: languageCode, ofType: "lproj"),
              let bundle = Bundle(path: path) else {
            return self
        }

        let localizedString = NSLocalizedString(self, bundle: bundle, comment: "")
        return localizedString
    }
}

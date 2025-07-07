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

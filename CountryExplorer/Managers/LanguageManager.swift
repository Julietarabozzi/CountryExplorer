//
//  LanguageManager.swift
//  CountryExplorer
//
//  Created by Maria julieta Rabozzi orelo on 07/07/2025.
//

import Foundation
import SwiftUI

final class LanguageManager: ObservableObject {
    static let shared = LanguageManager()
    
    @Published var currentLanguage: SelectedLanguage = .english {
        didSet {
            UserDefaults.standard.set(currentLanguage.rawValue, forKey: "appLanguage")
        }
    }

    init() {
        let saved = UserDefaults.standard.string(forKey: "appLanguage")
        currentLanguage = SelectedLanguage(rawValue: saved ?? "en") ?? .english
    }

    enum SelectedLanguage: String, CaseIterable, Identifiable {
        case english = "en"
        case spanish = "es"
        
        var id: String { rawValue }

        var title: String {
            switch self {
            case .english: "EN"
            case .spanish: "ES"
            }
        }
    }
}

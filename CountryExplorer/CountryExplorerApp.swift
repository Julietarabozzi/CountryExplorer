//
//  CountryExplorerApp.swift
//  CountryExplorer
//
//  Created by Maria julieta Rabozzi orelo on 05/07/2025.
//

import SwiftUI

@main
struct CountryExplorerApp: App {
    @StateObject private var languageManager = LanguageManager.shared

    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(languageManager)
                .environment(\.locale, .init(identifier: languageManager.currentLanguage.rawValue))
                .id(languageManager.currentLanguage) 
        }
    }
}

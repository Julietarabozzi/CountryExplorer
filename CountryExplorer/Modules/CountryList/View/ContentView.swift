//
//  ContentView.swift
//  CountryExplorer
//
//  Created by Maria julieta Rabozzi orelo on 05/07/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CountryListViewModel()
    @EnvironmentObject var languageManager: LanguageManager

    var body: some View {
        VStack {
            Picker("Language", selection: $languageManager.currentLanguage) {
                ForEach(LanguageManager.SelectedLanguage.allCases) { lang in
                    Text(lang.title).tag(lang)
                }
            }
            Text("Current language: \(languageManager.currentLanguage.rawValue)")
            .pickerStyle(.segmented)
            .padding()
            
            SearchBar(placeholder: "Search Country", text: $viewModel.searchText)

            List(viewModel.countries) { country in
                Text(country.name)
            }
        }
    }
}

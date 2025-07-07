//
//  ContentView.swift
//  CountryExplorer
//
//  Created by Maria julieta Rabozzi orelo on 05/07/2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = CountryListViewModel()
    @EnvironmentObject var languageManager: LanguageManager
    @State private var isShowingLanguageSheet = false

    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    isShowingLanguageSheet = true
                }) {
                    HStack(spacing: 8) {
                        Image(systemName: "globe")
                            .foregroundColor(.black)
                        Text(languageManager.currentLanguage.title)
                            .foregroundColor(.black)
                    }
                }
                .padding(.horizontal)
                .sheet(isPresented: $isShowingLanguageSheet) {
                    LanguageSelectionView()
                        .environmentObject(languageManager)
                }

                Spacer()
            }
            .padding(.top)
            SearchBar(placeholder: "Search Country", text: $viewModel.searchText)
                .frame(maxHeight: 30)
                .padding(.horizontal)

            List(viewModel.countries) { country in
                Text(country.name)
            }
        }
    }
}

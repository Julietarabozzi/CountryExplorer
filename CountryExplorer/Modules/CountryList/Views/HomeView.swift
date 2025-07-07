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
        VStack(spacing: 16) {
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
                .sheet(isPresented: $isShowingLanguageSheet) {
                    LanguageSelectionView()
                        .environmentObject(languageManager)
                }
                
                Spacer()
            }
            .padding(.horizontal)
            .padding(.top)
            
            // Título centrado
            HStack {
                Spacer()
                Text("Search")
                    .font(.title3.bold())
                Spacer()
            }
            
            // Search bar
            SearchBar(placeholder: "Search Country", text: $viewModel.searchText)
                .frame(maxHeight: 30)
                .padding(.horizontal)
            
            // Lista de países
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(viewModel.countries) { country in
                        CountryRowView(country: country)
                            .padding(.horizontal)
                    }
                }
                .padding(.top)
            }
        }
    }
}

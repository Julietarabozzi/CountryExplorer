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
    @EnvironmentObject var router: NavigationRouter
    
    var body: some View {
        VStack(spacing: .spacing16) {
            HStack {
                Button(action: {
                    isShowingLanguageSheet = true
                }) {
                    HStack(spacing: .spacing8) {
                        Image.globe
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
            
            HStack {
                Spacer()
                Text(String.searchTitle)
                    .font(.title3.bold())
                Spacer()
            }

            SearchBar(placeholder: String.searchTitle, text: $viewModel.searchText)
                .frame(maxHeight: .height30)
                .padding(.horizontal)
            
            ScrollView {
                LazyVStack(spacing: .spacing16) {
                    ForEach(viewModel.countries) { country in
                        CountryRowView(country: country)
                            .onTapGesture {
                                router.push(.countryDetail(country))
                            }
                    }
                }
                .padding(.top)
            }
        }
    }
}

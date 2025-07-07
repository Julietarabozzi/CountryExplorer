//
//  FavoritesView.swift
//  CountryExplorer
//
//  Created by Maria julieta Rabozzi orelo on 06/07/2025.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    @Query private var favorites: [CountryFavorite]

    var body: some View {
        VStack(spacing: 12) {
            SearchBar(placeholder: "Search", text: .constant(""))
                .frame(maxHeight: 30)
                .padding(.horizontal)

            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(favorites) { country in
                        CountryRowView(country: Country(from: country))
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

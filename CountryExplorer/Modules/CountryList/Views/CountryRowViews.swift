//
//  CountryRowViews.swift
//  CountryExplorer
//
//  Created by Maria julieta Rabozzi orelo on 07/07/2025.
//

import SwiftUI
import SwiftData

struct CountryRowView: View {
    let country: Country
    @Environment(\.modelContext) private var modelContext
    @Query private var favorites: [CountryFavorite]

    private var isFavorite: Bool {
        favorites.contains { $0.id == country.id }
    }

    var body: some View {
        HStack(spacing: .spacing16) {
            AsyncImage(url: URL(string: country.flagURL)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Color.gray.opacity(.percentage20)
            }
            .frame(width: .width50, height: .height35)
            .cornerRadius(.cornerRadius2)

            VStack(alignment: .leading, spacing: .spacing4) {
                Text(country.name)
                    .font(.headline)
                Text(country.officialName)
                    .font(.subheadline)
                    .foregroundColor(.primary)
                Text(country.capital)
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            Spacer()

            Button(action: toggleFavorite) {
                (isFavorite ? Image.bookmark : Image.bookmarkFill)
                    .foregroundColor(.blue)
                    .foregroundColor(.blue)
            }
            .buttonStyle(.plain)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(.cornerRadius12)
        .shadow(color: Color.black.opacity(.percentage20), radius: .cornerRadius4, x: .zero, y: .cgFloat2)
    }

    private func toggleFavorite() {
        if let existing = favorites.first(where: { $0.id == country.id }) {
            modelContext.delete(existing)
        } else {
            let favorite = CountryFavorite(from: country)
            modelContext.insert(favorite)
        }
    }
}

//
//  CountryRowViews.swift
//  CountryExplorer
//
//  Created by Maria julieta Rabozzi orelo on 07/07/2025.
//

import SwiftUI

struct CountryRowView: View {
    let country: Country

    var body: some View {
        HStack(spacing: 12) {
            AsyncImage(url: URL(string: country.flagURL)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Color.gray.opacity(0.3)
            }
            .frame(width: 50, height: 35)
            .cornerRadius(4)

            VStack(alignment: .leading, spacing: 4) {
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

            Image(systemName: "bookmark")
                .foregroundColor(.blue)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 2)
    }
}

//
//  CountryDetailView.swift
//  CountryExplorer
//
//  Created by Maria julieta Rabozzi orelo on 07/07/2025.
//

import Foundation
import SwiftUI

struct CountryDetailView: View {
    let country: Country

    var body: some View {
        ScrollView {
            VStack(spacing: .spacing50) {
                header
                InfoGridView(country: country)
                Spacer(minLength: .cgFloat40)
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }

    @ViewBuilder
    var header: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL(string: country.flagURL)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(height: .height180)
                    .clipped()
            } placeholder: {
                Color.gray.opacity(.percentage20)
                    .frame(height: .height180)
            }

            VStack(spacing: .spacing4) {
                Text(country.name)
                    .font(.title3.bold())
                Text(country.officialName)
                    .font(.subheadline)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(.cornerRadius12)
            .shadow(color: .black.opacity(.percentage20), radius: .cgFloat4, x: .zero, y: .cgFloat2)
            .offset(y: .cgFloat40)
            .padding(.horizontal)
        }
        .padding(.bottom)
    }
}

//
//  CountryDetailView.swift
//  CountryExplorer
//
//  Created by Maria julieta Rabozzi orelo on 07/07/2025.
//

import Foundation
import SwiftUI

struct CountryDetailView: View {
    @StateObject private var viewModel: CountryDetailViewModel

    init(country: Country) {
        _viewModel = StateObject(wrappedValue: CountryDetailViewModel(country: country))
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                AsyncImage(url: URL(string: viewModel.country.flagURL)) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    Color.gray.opacity(0.2)
                }
                .frame(height: 150)

                VStack(spacing: 4) {
                    Text(viewModel.country.name)
                        .font(.title2.bold())
                    Text(viewModel.country.officialName)
                        .font(.subheadline)
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)

                InfoGridView(viewModel: viewModel)

                Spacer(minLength: 40)
            }
            .padding()
        }
        .navigationTitle(viewModel.country.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

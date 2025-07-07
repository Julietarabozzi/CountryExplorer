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
            VStack(spacing: 50) {

                header
                InfoGridView(viewModel: viewModel)
                Spacer(minLength: 40)
            }
            .padding()
        }
        .navigationTitle(viewModel.country.name)
        .navigationBarTitleDisplayMode(.inline)
    }

    @ViewBuilder
    var header: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL(string: viewModel.country.flagURL)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 180)
                    .clipped()
            } placeholder: {
                Color.gray.opacity(0.2)
                    .frame(height: 180)
            }

            VStack(spacing: 4) {
                Text(viewModel.country.name)
                    .font(.title3.bold())
                Text(viewModel.country.officialName)
                    .font(.subheadline)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
            .offset(y: 30)
            .padding(.horizontal)
        }
        .padding(.bottom, 20)
    }
}

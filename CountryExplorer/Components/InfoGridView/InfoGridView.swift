//
//  InfoGridView.swift
//  CountryExplorer
//
//  Created by Maria julieta Rabozzi orelo on 07/07/2025.
//

import SwiftUI

struct InfoGridView: View {
    let viewModel: CountryDetailViewModel

    var body: some View {
        VStack(spacing: 16) {
            HStack(spacing: 16) {
                InfoCard(title: "Region", value: viewModel.country.region)
                InfoCard(title: "Subregion", value: viewModel.country.subregion)
                InfoCard(title: "Capital", value: viewModel.country.capital)
            }

            HStack(spacing: 16) {
                InfoCard(title: "Timezone(s)", value: viewModel.joinedTimezones.joined(separator: "\n"))
                InfoCard(title: "Population", value: viewModel.populationFormatted)
            }

            HStack(spacing: 16) {
                InfoCard(title: "Languages", value: viewModel.joinedLanguages)
                InfoCard(title: "Currencies", value: viewModel.joinedCurrencies)
            }

            HStack(spacing: 16) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Car Drive Side")
                        .font(.headline)
                    HStack {
                        Label("LEFT", systemImage: "car.fill")
                            .opacity(viewModel.isRightHandDriving ? 0.2 : 1)
                        Label("RIGHT", systemImage: "car.fill")
                            .opacity(viewModel.isRightHandDriving ? 1 : 0.2)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                .cornerRadius(12)
                .shadow(radius: 1)

                AsyncImage(url: URL(string: viewModel.country.coatOfArmsURL)) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    Color.gray.opacity(0.2)
                }
                .frame(width: 80, height: 80)
            }
        }
    }
}


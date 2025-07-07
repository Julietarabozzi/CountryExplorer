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
        VStack(spacing: .spacing16) {
            HStack(spacing: .spacing16) {
                InfoCard(title: "Region", value: viewModel.country.region)
                InfoCard(title: "Subregion", value: viewModel.country.subregion)
                InfoCard(title: "Capital", value: viewModel.country.capital)
            }

            HStack(spacing: .spacing16) {
                InfoCard(title: "Timezone(s)", value: viewModel.joinedTimezones.joined(separator: "\n"))
                InfoCard(title: "Population", value: viewModel.populationFormatted)
            }

            HStack(spacing: .spacing16) {
                InfoCard(title: "Languages", value: viewModel.joinedLanguages)
                InfoCard(title: "Currencies", value: viewModel.joinedCurrencies)
            }

            HStack(spacing: .spacing16) {
                VStack(alignment: .leading, spacing: .spacing8) {
                    Text("Car Drive Side")
                        .font(.headline)
                    HStack {
                        Label("LEFT", systemImage: "car.fill")
                            .opacity(viewModel.isRightHandDriving ? .percentage20 : .percentage100)
                        Label("RIGHT", systemImage: "car.fill")
                            .opacity(viewModel.isRightHandDriving ? .percentage100 : .percentage20)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                .cornerRadius(.cornerRadius12)
                .shadow(radius: .cgFloat1)

                AsyncImage(url: URL(string: viewModel.country.coatOfArmsURL)) { image in
                    image.resizable().scaledToFit()
                } placeholder: {
                    Color.gray.opacity(.percentage20)
                }
                .frame(width: .size80, height: .size80)
            }
        }
    }
}

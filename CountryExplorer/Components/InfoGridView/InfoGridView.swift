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
            RegionInfoRowView(
                region: viewModel.country.region,
                subregion: viewModel.country.subregion,
                capital: viewModel.country.capital
            )

            HStack(spacing: .spacing16) {
                InfoCard(title: String.timezoneTitle, value: viewModel.joinedTimezones.joined(separator: "\n"))
                InfoCard(title: String.populationTitle, value: viewModel.populationFormatted)
            }

            HStack(spacing: .spacing16) {
                InfoCard(title: String.languagesTitle, value: viewModel.joinedLanguages)
                InfoCard(title: String.currenciesTitle, value: viewModel.joinedCurrencies)
            }

            HStack(spacing: .spacing16) {
                DriveSideCardView(isRightHandDriving: viewModel.isRightHandDriving)
                CoatOfArmsCardView(imageURL: viewModel.country.coatOfArmsURL)
            }
        }
    }
}

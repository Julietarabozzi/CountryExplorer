//
//  InfoGridView.swift
//  CountryExplorer
//
//  Created by Maria julieta Rabozzi orelo on 07/07/2025.
//

import SwiftUI

struct InfoGridView: View {
    let country: Country

    var body: some View {
        VStack(spacing: .spacing16) {
            RegionInfoRowView(
                region: country.region,
                subregion: country.subregion,
                capital: country.capital
            )

            HStack(spacing: .spacing16) {
                InfoCard(
                    title: String.timezoneTitle,
                    value: country.joinedTimezones 
                )
                InfoCard(
                    title: String.populationTitle,
                    value: country.populationFormatted
                )
            }

            HStack(spacing: .spacing16) {
                InfoCard(
                    title: String.languagesTitle,
                    value: country.joinedLanguages
                )
                InfoCard(
                    title: String.currenciesTitle,
                    value: country.joinedCurrencies
                )
            }

            HStack(spacing: .spacing16) {
                DriveSideCardView(isRightHandDriving: country.isRightHandDriving)
                CoatOfArmsCardView(imageURL: country.coatOfArmsURL)
            }
        }
    }
}

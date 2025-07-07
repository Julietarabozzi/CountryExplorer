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
                InfoCard(title: String.regionTitle, value: viewModel.country.region)
                InfoCard(title: String.subregionTitle, value: viewModel.country.subregion)
                InfoCard(title: String.capitalTitle, value: viewModel.country.capital)
            }

            HStack(spacing: .spacing16) {
                InfoCard(title: String.timezoneTitle, value: viewModel.joinedTimezones.joined(separator: "\n"))
                InfoCard(title: String.populationTitle, value: viewModel.populationFormatted)
            }

            HStack(spacing: .spacing16) {
                InfoCard(title: String.languagesTitle, value: viewModel.joinedLanguages)
                InfoCard(title: String.currenciesTitle, value: viewModel.joinedCurrencies)
            }

            HStack(spacing: .spacing16) {
                VStack(alignment: .leading, spacing: .spacing8) {
                    Text(String.carSideTitle)
                        .font(.headline)
                    HStack {
                        Label {
                            Text(String.leftDrive)
                        } icon: {
                            Image.carFill
                        }
                            .opacity(viewModel.isRightHandDriving ? .percentage20 : .percentage100)
                        Label {
                            Text(String.rightDrive)
                        } icon: {
                            Image.carFill
                        }
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

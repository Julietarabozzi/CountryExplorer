//
//  AppRoute.swift
//  CountryExplorer
//
//  Created by Maria julieta Rabozzi orelo on 07/07/2025.
//

import Foundation
import SwiftUI

enum AppRoute: Hashable {
    case countryDetail(Country)
}

extension AppRoute {
    @ViewBuilder
    func view() -> some View {
        switch self {
        case .countryDetail(let country):
            CountryDetailView(country: country)
        }
    }
}

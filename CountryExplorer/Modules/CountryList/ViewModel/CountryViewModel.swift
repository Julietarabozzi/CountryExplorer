//
//  CountryViewModel.swift
//  CountryExplorer
//
//  Created by Maria julieta Rabozzi orelo on 05/07/2025.
//

import SwiftUI

class CountryListViewModel: ObservableObject {
    @Published var searchText: String = "" {
        didSet {
            filterCountries()
        }
    }

    @Published var countries: [Country] = []
    private var allCountries: [Country] = []
    private let service: CountryServiceProtocol

    init(service: CountryServiceProtocol = CountryService()) {
        self.service = service
        Task {
            await fetchCountries()
        }
    }

    @MainActor
    private func fetchCountries() async {
        do {
            let fetched = try await service.fetchCountries()
            self.allCountries = fetched
            self.countries = fetched
        } catch {
            print("❌ Error fetching countries:", error)
        }
    }

    private func filterCountries() {
        if searchText.isEmpty {
            countries = allCountries
        } else {
            countries = allCountries.filter {
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
}

//
//  CountryExplorerTests.swift
//  CountryExplorerTests
//
//  Created by Maria julieta Rabozzi orelo on 05/07/2025.
//

import XCTest
@testable import CountryExplorer

final class CountryListViewModelTests: XCTestCase {

    class MockCountryService: CountryServiceProtocol {
        var countriesToReturn: [Country] = []
        var fetchCalled = false

        func fetchCountries() async throws -> [Country] {
            fetchCalled = true
            return countriesToReturn
        }
    }

    func test_fetchCountries_populatesCountries() async {
        // Given
        let mockService = MockCountryService()
        mockService.countriesToReturn = [
            Country(id: "ARG", name: "Argentina", officialName: "Argentine Republic", capital: "Buenos Aires", region: "Americas", subregion: "South America", population: 45000000, timezones: ["UTC-03:00"], languages: ["Spanish"], currencies: ["$ Argentine Peso"], carSide: "right", flagURL: "", coatOfArmsURL: "")
        ]

        let viewModel = CountryListViewModel(service: mockService)

        // When
        try? await Task.sleep(nanoseconds: 300_000_000) // Espera breve para inicialización

        // Then
        XCTAssertTrue(mockService.fetchCalled)
        XCTAssertEqual(viewModel.countries.count, 1)
        XCTAssertEqual(viewModel.countries.first?.name, "Argentina")
    }

    func test_filterCountries_filtersBySearchText() async {
        // Given
        let mockService = MockCountryService()
        mockService.countriesToReturn = [
            Country(id: "ARG", name: "Argentina", officialName: "Argentine Republic", capital: "Buenos Aires", region: "Americas", subregion: "South America", population: 45000000, timezones: ["UTC-03:00"], languages: ["Spanish"], currencies: ["$ Argentine Peso"], carSide: "right", flagURL: "", coatOfArmsURL: ""),
            Country(id: "BRA", name: "Brazil", officialName: "Federative Republic of Brazil", capital: "Brasilia", region: "Americas", subregion: "South America", population: 210000000, timezones: ["UTC-03:00"], languages: ["Portuguese"], currencies: ["R$ Real"], carSide: "right", flagURL: "", coatOfArmsURL: "")
        ]

        let viewModel = CountryListViewModel(service: mockService)

        try? await Task.sleep(nanoseconds: 300_000_000)

        // When
        viewModel.searchText = "bra"

        // Then
        XCTAssertEqual(viewModel.countries.count, 1)
        XCTAssertEqual(viewModel.countries.first?.name, "Brazil")
    }
}

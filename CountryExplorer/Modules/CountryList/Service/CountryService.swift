//
//  CountryService.swift
//  CountryExplorer
//
//  Created by Maria julieta Rabozzi orelo on 07/07/2025.
//

import Foundation
import Foundation

protocol CountryServiceProtocol {
    func fetchCountries() async throws -> [Country]
}

class CountryService: CountryServiceProtocol {
    private let networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }

    func fetchCountries() async throws -> [Country] {
        let dto = try await networkService.fetch(
            CountryAPI.allCountries(fields: [
                "name",
                "capital",
                "flags",
                "coatOfArms",     
                "cca3",
                "region",
                "subregion",
                "timezones",
                "languages",
                "currencies"
            ]),
            as: [CountryDTO].self
        )
        return dto.compactMap { $0.toDomain() }
    }
}

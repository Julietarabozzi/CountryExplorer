//
//  CountryViewModel.swift
//  CountryExplorer
//
//  Created by Maria julieta Rabozzi orelo on 05/07/2025.
//

import SwiftUI

class CountryListViewModel: ObservableObject {
    @Published var searchText: String = ""{
        didSet {
            filterCountries()
        }
    }
    
    @Published var countries: [Country] = []
    
    private var allCountries: [Country] = [
        Country(id: "1", name: "Argentina", officialName: "Argentine Republic", capital: "Buenos Aires", flagURL: "https://flagcdn.com/w320/ar.png"),
        Country(id: "2", name: "Brasil", officialName: "Federative Republic of Brazil", capital: "Brasília", flagURL: "https://flagcdn.com/w320/br.png"),
        Country(id: "3", name: "Chile", officialName: "Republic of Chile", capital: "Santiago", flagURL: "https://flagcdn.com/w320/cl.png")
    ]
    
    init() {
        countries = allCountries // show all countries at the beginning
    }

    private func filterCountries() {
        if searchText.isEmpty {
            countries = allCountries // if fied is empty shows all countries
        } else {
            countries = allCountries.filter {
                $0.name.lowercased().contains(searchText.lowercased()) //if not, filters
            }
        }
    }
}

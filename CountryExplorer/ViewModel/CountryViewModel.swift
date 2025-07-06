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
        Country(id: "1", name: "Argentina"),
        Country(id: "2", name: "Brasil"),
        Country(id: "3", name: "Chile")
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

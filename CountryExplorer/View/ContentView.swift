//
//  ContentView.swift
//  CountryExplorer
//
//  Created by Maria julieta Rabozzi orelo on 05/07/2025.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = CountryListViewModel()
    
    var body: some View {
        VStack {
            SearchBar(placeholder: "Search Country", text: $viewModel.searchText)
            List(viewModel.countries) { country in
                Text(country.name)
            }
        }
    }
}



#Preview {
    ContentView()
}

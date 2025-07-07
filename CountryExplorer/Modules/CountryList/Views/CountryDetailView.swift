//
//  CountryDetailView.swift
//  CountryExplorer
//
//  Created by Maria julieta Rabozzi orelo on 07/07/2025.
//

import Foundation
import SwiftUI

struct CountryDetailView: View {
    let country: Country

    var body: some View {
        Text("Detail for \(country.name)")
            .font(.title)
            .navigationTitle(country.name)
    }
}

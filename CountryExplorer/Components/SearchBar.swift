//
//  SearchBar.swift
//  CountryExplorer
//
//  Created by Maria julieta Rabozzi orelo on 05/07/2025.
//

import SwiftUI

struct SearchBar: View {
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: .cornerRadius12)
            .fill(Color(.systemGray6))
            .overlay(
                HStack {
                    Image.magnifyingglass
                        .foregroundColor(.gray)
                    TextField(placeholder, text: $text)
                }
                    .padding(.padding5)
            )
    }
}

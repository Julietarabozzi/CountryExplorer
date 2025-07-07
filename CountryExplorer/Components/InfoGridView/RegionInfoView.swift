//
//  RegionInfoView.swift
//  CountryExplorer
//
//  Created by Maria julieta Rabozzi orelo on 07/07/2025.
//

import Foundation
import SwiftUI

struct RegionInfoRowView: View {
    let region: String
    let subregion: String
    let capital: String

    var body: some View {
        HStack(spacing: .zero) {
            regionBlock(title: String.regionTitle, value: region)
            
            Divider()
                .frame(height: .height40)
                .padding(.vertical, .padding8)

            regionBlock(title: String.subregionTitle, value: subregion)

            Divider()
                .frame(height: .height40)
                .padding(.vertical, .padding8)

            regionBlock(title: String.capitalTitle, value: capital)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .cornerRadius(.cornerRadius4)
        .shadow(radius: .cornerRadius2)
    }

    @ViewBuilder
    private func regionBlock(title: String, value: String) -> some View {
        VStack {
            Text(title)
                .font(.subheadline.bold())
            Text(value)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity)
    }
}

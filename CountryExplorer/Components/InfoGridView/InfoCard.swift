//
//  InfoCard.swift
//  CountryExplorer
//
//  Created by Maria julieta Rabozzi orelo on 07/07/2025.
//

import Foundation
import SwiftUI

struct InfoCard: View {
    var title: String
    var value: String

    var body: some View {
        VStack(alignment: .leading, spacing: .spacing4) {
            Text(title)
                .font(.subheadline.bold())
            Text(value)
                .font(.subheadline)
        }
        .frame(maxHeight: .height40)
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .cornerRadius(.cornerRadius4)
        .shadow(radius: .cornerRadius2)
    }
}

//
//  CoatOfArmsView.swift
//  CountryExplorer
//
//  Created by Maria julieta Rabozzi orelo on 07/07/2025.
//

import Foundation
import SwiftUI

struct CoatOfArmsCardView: View {
    let imageURL: String

    var body: some View {
        VStack(alignment: .center) {
            Text(String.coatOfArmsTitle)
                .font(.subheadline.bold())

            AsyncImage(url: URL(string: imageURL)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Color.gray.opacity(.percentage20)
            }
            .frame(width: .size40, height: .size40)
        }
        .frame(maxHeight: .height40)
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .cornerRadius(.cornerRadius4)
        .shadow(radius: .cornerRadius2)
    }
}

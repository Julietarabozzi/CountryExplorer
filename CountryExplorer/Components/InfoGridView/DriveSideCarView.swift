//
//  DriveSideCarView.swift
//  CountryExplorer
//
//  Created by Maria julieta Rabozzi orelo on 07/07/2025.
//

import Foundation
import SwiftUI

struct DriveSideCardView: View {
    let isRightHandDriving: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: .spacing8) {
            Text(String.carSideTitle)
                .font(.subheadline.bold())

            HStack(spacing: .spacing8) {
                Text(String.leftDrive)
                    .foregroundColor(.primary)
                    .opacity(isRightHandDriving ? .percentage20 : .percentage100)

                Image.carFill
                    .opacity(.percentage100)

                Text(String.rightDrive)
                    .foregroundColor(.primary)
                    .opacity(isRightHandDriving ? .percentage100 : .percentage20)
            }
        }
        .frame(maxHeight: .height40)
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .cornerRadius(.cornerRadius4)
        .shadow(radius: .cornerRadius2)
    }
}

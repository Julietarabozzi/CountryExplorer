//
//  View+.swift
//  CountryExplorer
//
//  Created by Maria julieta Rabozzi orelo on 07/07/2025.
//

import Foundation
import SwiftUI
extension View {
    func environmentLanguage(_ language: String) -> some View {
        self.environment(\.locale, .init(identifier: language))
    }
}

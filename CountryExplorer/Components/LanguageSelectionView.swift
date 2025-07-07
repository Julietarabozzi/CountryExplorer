//
//  LanguageSelectionView.swift
//  CountryExplorer
//
//  Created by Maria julieta Rabozzi orelo on 07/07/2025.
//

import Foundation
import SwiftUI

struct LanguageSelectionView: View {
    @EnvironmentObject var languageManager: LanguageManager
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationView {
            List {
                ForEach(LanguageManager.SelectedLanguage.allCases) { lang in
                    HStack {
                        Text(lang.title)
                            .foregroundColor(.black)
                        Spacer()
                        if lang == languageManager.currentLanguage {
                            Image.checkmark
                                .foregroundColor(.black)
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        languageManager.currentLanguage = lang
                        dismiss()
                    }
                }
            }
            .navigationTitle(String.selectLanguajeTitle)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

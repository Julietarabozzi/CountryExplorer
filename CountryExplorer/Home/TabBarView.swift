//
//  TabBarView.swift
//  CountryExplorer
//
//  Created by Maria julieta Rabozzi orelo on 06/07/2025.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView() {
            
            ContentView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text(String.favoriteTitle)
            }
            FavoritesView()
                .tabItem {
                    Image(systemName: "star")
                    Text(String.favoriteTitle)
                }
        }
    }
}

#Preview {
    TabBarView()
}

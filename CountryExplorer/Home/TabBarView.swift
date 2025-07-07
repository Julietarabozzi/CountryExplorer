//
//  TabBarView.swift
//  CountryExplorer
//
//  Created by Maria julieta Rabozzi orelo on 06/07/2025.
//

import SwiftUI

struct TabBarView: View {
    @StateObject private var router = NavigationRouter()

    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemGray6
        appearance.stackedLayoutAppearance.selected.iconColor = .systemBlue
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.systemBlue]
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }

    var body: some View {
        NavigationStack(path: $router.path) {
            TabView {
                HomeView()
                    .environmentObject(router)
                    .tabItem {
                        Image.magnifyingglass
                        Text(String.searchTitle)
                    }

                FavoritesView()
                    .tabItem {
                        Image.star
                        Text(String.savedTitle)
                    }
            }
            .navigationDestination(for: AppRoute.self) { $0.view() }
        }
    }
}

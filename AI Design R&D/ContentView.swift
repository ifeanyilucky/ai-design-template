//
//  ContentView.swift
//  AI Design R&D
//
//  Created by Great Codack's Macbook on 4/18/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0

    // Custom colors
    let primaryColor = Color(red: 0.2, green: 0.5, blue: 0.9)
    let secondaryColor = Color(red: 0.9, green: 0.3, blue: 0.5)
    let backgroundColor = Color(red: 0.95, green: 0.95, blue: 0.97)

    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView(primaryColor: primaryColor)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(0)

            ExploreView(secondaryColor: secondaryColor)
                .tabItem {
                    Image(systemName: "safari.fill")
                    Text("Explore")
                }
                .tag(1)

            ProfileView(primaryColor: primaryColor, secondaryColor: secondaryColor)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
                .tag(2)

            SettingsView(backgroundColor: backgroundColor)
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
                .tag(3)
        }
        .accentColor(primaryColor)
        .onAppear {
            // Customize tab bar appearance
            let appearance = UITabBarAppearance()
            appearance.backgroundColor = UIColor(backgroundColor)
            appearance.shadowColor = UIColor.gray.withAlphaComponent(0.3)

            // Apply the appearance
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}

#Preview {
    ContentView()
}

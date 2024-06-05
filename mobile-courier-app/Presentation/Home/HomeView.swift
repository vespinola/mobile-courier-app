//
//  HomeView.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-05-27.
//

import SwiftUI

struct HomeView: View {
  @EnvironmentObject var coordinator: Coordinator

  init() {
    UITabBar.appearance().backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
  }

  var body: some View {
    TabView {
      ProfileView()
        .tabItem {
          Label("Home", systemImage: "house")
        }

      ProfileView()
        .tabItem {
          Label("Withdrawn", systemImage: "bag")
        }
      ProfileView()
        .tabItem {
          Label("Profile", systemImage: "person")
        }
    }
    .navigationTitle("")
    .toolbar(.hidden)
  }
}

#Preview {
  HomeView()
}

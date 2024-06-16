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
    HeaderView()

    TabView {
      PackagesView()
        .tabItem {
          Label("Home", systemImage: "house")
        }

      PackagesView()
        .tabItem {
          Label("Withdrawn", systemImage: "bag")
        }
      coordinator.build(page: .profile)
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

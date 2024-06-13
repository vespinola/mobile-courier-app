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
      coordinator.build(page: .profile)
        .tabItem {
          Label("Home", systemImage: "house")
        }

      EmptyView()
        .tabItem {
          Label("Withdrawn", systemImage: "bag")
        }
      EmptyView()
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

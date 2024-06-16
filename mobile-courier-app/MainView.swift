//
//  ContentView.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-05-04.
//

import SwiftUI

struct MainView: View {
  @StateObject private var coordinator = Coordinator()

  var body: some View {
    NavigationStack(path: $coordinator.path) {
      coordinator.build(page: .login)
        .navigationDestination(for: Page.self) { page in
          coordinator.build(page: page)
        }
        .sheet(item: $coordinator.sheet) { sheet in
          coordinator.build(sheet: sheet)
        }
    }
    .environmentObject(coordinator)
    .environmentObject(AppData.shared)
  }
}

#Preview {
  MainView()
}

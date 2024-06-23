//
//  ContentView.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-05-04.
//

import SwiftUI

struct CoordinatorRootView: View {
  @EnvironmentObject private var coordinator: Coordinator
  @EnvironmentObject private var appData: AppData

  var body: some View {
    NavigationStack(path: $coordinator.path) {
      coordinator.build(page: .login)
        .navigationDestination(for: Page.self) { page in
          coordinator.build(page: page)
        }
    }
  }
}

#Preview {
  CoordinatorRootView()
}

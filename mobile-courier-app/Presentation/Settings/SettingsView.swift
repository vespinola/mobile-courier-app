//
//  SettingsView.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-23.
//

import SwiftUI

struct SettingsView: View {
  @AppStorage("isDarkMode") var darkModeOn: Bool = false
  @EnvironmentObject var coordinator: Coordinator
  @ObservedObject var viewModel: SettingsViewModel

  var body: some View {
    VStack {
      List {
        Section {
          Toggle("Dark Mode", isOn: $darkModeOn)
        }

        Section {
          Button("Log out", role: .destructive) {
            viewModel.doLogout()
            coordinator.popToRoot()
          }
        }
      }
    }
  }
}

#Preview {
  SettingsView(viewModel: .previewInstance())
    .environmentObject(Coordinator(diContainer: AppDIContainerMock()))
}

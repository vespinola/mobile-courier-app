//
//  ConfigurationView.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-23.
//

import SwiftUI

struct ConfigurationView: View {
  @AppStorage("isDarkMode") var darkModeOn: Bool = false
  @EnvironmentObject var coordinator: Coordinator

  var body: some View {
    VStack {
      List {
        Section {
          Toggle("Dark Mode", isOn: $darkModeOn)
        }

        Section {
          Button("Log out", role: .destructive) {
            coordinator.popToRoot()
          }
        }
      }
    }
  }
}

#Preview {
  ConfigurationView()
    .environmentObject(Coordinator(diContainer: AppDIContainerMock()))
}

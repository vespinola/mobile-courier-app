//
//  HomeView.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-05-27.
//

import SwiftUI

struct HomeView: View {
  @EnvironmentObject var coordinator: Coordinator
  @ObservedObject var viewModel: HomeViewModel

  @State var selectedTab = 0

  var body: some View {
    VStack(spacing: .zero) {
      HeaderView()

      getTabView()
        .navigationTitle("")
        .toolbar(.hidden)
        .sheet(item: $coordinator.sheet) { sheet in
          coordinator.build(sheet: sheet)
        }
        .toast(message: $viewModel.toastMessage)
        .onAppear {
          Task {
            await viewModel.getAddresses()
          }
        }
    }
  }

  @ViewBuilder
  private func getTabView() -> some View {
    TabView(selection: $selectedTab) {
      coordinator.build(page: .packagesForWithdrawl)
        .tabItem {
          Label("Home", systemImage: "house")
            .accessibilityIdentifier(
              AccessibilityIdentifiers.Home.homeTab
            )
        }
        .tag(0)

      coordinator.build(page: .withdrawnPackages)
        .tabItem {
          Label("Withdrawn", systemImage: "bag")
            .accessibilityIdentifier(
              AccessibilityIdentifiers.Home.withdrawnTab
            )
        }
        .tag(1)

      getProfileChildView(addresses: viewModel.addresses)
        .tabItem {
          Label("Profile", systemImage: "person")
            .accessibilityIdentifier(
              AccessibilityIdentifiers.Home.profileTab
            )
        }
        .tag(2)

      coordinator.build(page: .configurations)
        .tabItem {
          Label("Settings", systemImage: "gear")
            .accessibilityIdentifier(
              AccessibilityIdentifiers.Home.settingsTab
            )
        }
        .tag(3)
    }
  }

  @ViewBuilder
  private func getProfileChildView(addresses: AddressesEntity?) -> some View {
    if let addresses = addresses {
      coordinator.build(page: .profile)
        .environmentObject(addresses)
    } else {
      Text("Loading...")
    }
  }
}

#Preview {
  HomeView(viewModel: .previewInstance())
    .environmentObject(Coordinator(diContainer: AppDIContainerMock()))
    .environmentObject(AppData.mock)
}

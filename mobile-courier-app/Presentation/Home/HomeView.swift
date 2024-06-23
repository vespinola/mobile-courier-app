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
    HeaderView()

    TabView(selection: $selectedTab) {
      coordinator.build(page: .packagesForWithdrawl)
        .tabItem {
          Label("Home", systemImage: "house")
        }
        .tag(0)

      coordinator.build(page: .withdrawnPackages)
        .tabItem {
          Label("Withdrawn", systemImage: "bag")
        }
        .tag(1)

      getProfileChildView(addresses: viewModel.addresses)
        .tabItem {
          Label("Profile", systemImage: "person")
        }
        .tag(2)
    }
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
    .environmentObject(Coordinator(diContainer: AppDIContainer()))
}

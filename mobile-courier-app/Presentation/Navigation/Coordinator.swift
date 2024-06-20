//
//  Coordinator.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-03.
//

import SwiftUI

enum Page: String, Identifiable {
  case login
  case home
  case profile
  case withdrawnPackages
  case packagesForWithdrawl

  var id: String {
    self.rawValue
  }
}

enum Sheet: String, Identifiable {
  case pageDetail

  var id: String {
    self.rawValue
  }
}

final class Coordinator: ObservableObject {
  @Published var path = NavigationPath()
  @Published var sheet: Sheet?

  func push(_ page: Page) {
    path.append(page)
  }

  func present(sheet: Sheet) {
    self.sheet = sheet
  }

  func pop() {
    path.removeLast()
  }

  func popToRoot() {
    path.removeLast(path.count)
  }

  func dismissSheet() {
    self.sheet = nil
  }

  // MARK: Views

  @ViewBuilder
  func build(page: Page) -> some View {
    let apiClient = APIRequestClient()

    switch page {
    case .login:
      let authRepo = AuthRepository(apiRequestClient: apiClient)
      LoginView(viewModel: .init(authRepository: authRepo))
    case .profile:
      let addressRepo = AddressRespository(apiRequestClient: apiClient)
      ProfileView(viewModel: .init(addressesRepository: addressRepo))
    case .home:
      HomeView()
    case .withdrawnPackages:
      let packagesRepo = PackagesRepository(apiRequestClient: apiClient)
      WithdrawnPackagesView(viewModel: .init(packagesRepository: packagesRepo))
    case .packagesForWithdrawl:
      let packagesRepo = PackagesRepository(apiRequestClient: apiClient)
      PackagesForWithdrawalView(viewModel: .init(packagesRepository: packagesRepo))
    }
  }

  @ViewBuilder
  func build(sheet: Sheet) -> some View {
    switch sheet {
    case .pageDetail:
      EmptyView()
    }
  }
}

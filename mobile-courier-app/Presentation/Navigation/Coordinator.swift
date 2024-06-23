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

enum Sheet: Identifiable {
  case shipmentDetail(groupedPackage: GroupedPackageEntity)

  var id: String {
    switch self {
    case .shipmentDetail:
      return "shipmentDetail"
    }
  }
}

final class Coordinator: ObservableObject {
  @Published var path = NavigationPath()
  @Published var sheet: Sheet?

  private var diContainer: DIContainerProtocol

  init(diContainer: DIContainerProtocol) {
    self.diContainer = diContainer
  }

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
    switch page {
    case .login:
      LoginView(
        viewModel: diContainer.resolve(LoginViewModel.self)
      )
    case .profile:
      ProfileView()
    case .home:
      HomeView(
        viewModel: diContainer.resolve(HomeViewModel.self)
      )
    case .withdrawnPackages:
        WithdrawnPackagesView(
          viewModel: diContainer.resolve(WithdrawnPackagesViewModel.self)
        )
    case .packagesForWithdrawl:
      PackagesForWithdrawalView(
        viewModel: diContainer.resolve(PackagesForWithdrawalViewModel.self)
      )
    }
  }

  @ViewBuilder
  func build(sheet: Sheet) -> some View {
    switch sheet {
    case .shipmentDetail(let groupedPackage):
        ShipmentDetailView(groupedPackage: groupedPackage)
          .presentationDetents([.fraction(0.3), .fraction(0.6)])
    }
  }
}

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
  case configurations

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

public final class Coordinator: ObservableObject {
  @Published var path = NavigationPath()
  @Published var sheet: Sheet?

  private var diContainer: DIContainerProtocol

  public init(diContainer: DIContainerProtocol) {
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
        viewModel: .init(authRepository: self.diContainer.resolve(AuthRepositoryProtocol.self), storage: self.diContainer.resolve(Storage.self))
      )
    case .profile:
      ProfileView()
    case .home:
      HomeView(
        viewModel: .init(addressesRepository: self.diContainer.resolve(AddressRepositoryProtocol.self))
      )
    case .withdrawnPackages:
        WithdrawnPackagesView(
          viewModel: .init(packagesRepository: self.diContainer.resolve(PackagesRepositoryProtocol.self))
        )
    case .packagesForWithdrawl:
      PackagesForWithdrawalView(
        viewModel: .init(packagesRepository: self.diContainer.resolve(PackagesRepositoryProtocol.self))
      )
    case .configurations:
        SettingsView(
          viewModel: .init(authRepository: diContainer.resolve(AuthRepositoryProtocol.self))
        )
    }
  }

  @ViewBuilder
  func build(sheet: Sheet) -> some View {
    switch sheet {
    case .shipmentDetail(let groupedPackage):
        ShipmentDetailView(groupedPackage: groupedPackage)
          .presentationDetents([.fraction(0.5), .fraction(0.8)])
    }
  }
}

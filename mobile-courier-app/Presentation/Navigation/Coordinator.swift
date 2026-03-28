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
  private let factory: ViewModelFactory

  public init(diContainer: DIContainerProtocol) {
    self.diContainer = diContainer
    self.factory = ViewModelFactory(
      makeLoginViewModel: { LoginViewModel(authRepository: diContainer.resolve(AuthRepositoryProtocol.self), storage: diContainer.resolve(Storage.self)) },
      makeHomeViewModel: { HomeViewModel(addressesRepository: diContainer.resolve(AddressRepositoryProtocol.self)) },
      makePackagesForWithdrawalViewModel: { PackagesForWithdrawalViewModel(packagesRepository: diContainer.resolve(PackagesRepositoryProtocol.self)) },
      makeWithdrawnPackagesViewModel: { WithdrawnPackagesViewModel(packagesRepository: diContainer.resolve(PackagesRepositoryProtocol.self)) },
      makeSettingsViewModel: { SettingsViewModel(authRepository: diContainer.resolve(AuthRepositoryProtocol.self)) }
    )
  }

  /// Clears navigation state and any transient UI for a fresh session
  public func resetForLogout() {
    // Dismiss any presented sheets
    self.sheet = nil
    // Reset navigation back to login
    self.path.removeLast(self.path.count)
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

  public func popToRoot() {
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
      LoginView(viewModel: self.factory.makeLoginViewModel())
    case .profile:
      ProfileView()
    case .home:
      HomeView(viewModel: self.factory.makeHomeViewModel())
    case .withdrawnPackages:
        WithdrawnPackagesView(viewModel: self.factory.makeWithdrawnPackagesViewModel())
    case .packagesForWithdrawl:
      PackagesForWithdrawalView(viewModel: self.factory.makePackagesForWithdrawalViewModel())
    case .configurations:
        SettingsView(viewModel: self.factory.makeSettingsViewModel())
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

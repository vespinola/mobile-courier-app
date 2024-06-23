//
//  AppDIContainer.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-21.
//

import Foundation

final class AppDIContainer: DIContainerProtocol {
  private var services: [String: Any] = [:]

  init() {
    // Repositories
    register(AuthRepository(), for: AuthRepositoryProtocol.self)
    register(AddressRespository(), for: AddressRepositoryProtocol.self)
    register(PackagesRepository(), for: PackagesRepositoryProtocol.self)

    // ViewModels
    register(
      LoginViewModel(authRepository: resolve(AuthRepositoryProtocol.self)),
      for: LoginViewModel.self
    )
    register(
      HomeViewModel(addressesRepository: resolve(AddressRepositoryProtocol.self)),
      for: HomeViewModel.self
    )
    register(
      WithdrawnPackagesViewModel(packagesRepository: resolve(PackagesRepositoryProtocol.self)),
      for: WithdrawnPackagesViewModel.self
    )
    register(
      PackagesForWithdrawalViewModel(packagesRepository: resolve(PackagesRepositoryProtocol.self)),
      for: PackagesForWithdrawalViewModel.self
    )
  }

  func register<T>(_ service: T, for type: T.Type) {
    let key = String(describing: type)
    services[key] = service
  }
  
  func resolve<T>(_ type: T.Type) -> T {
    let key = String(describing: type)
    guard let service = services[key] as? T else {
      fatalError("Service for \(type) not found")
    }
    return service
  }
}

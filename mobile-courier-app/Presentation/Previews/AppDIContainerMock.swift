//
//  AppDIContainerMock.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-23.
//

import Foundation

final class AppDIContainerMock: DIContainerProtocol {
  private var services: [String: Any] = [:]

  init() {
    // ViewModels
    register(
      LoginViewModel.previewInstance(),
      for: LoginViewModel.self
    )
    register(
      HomeViewModel.previewInstance(),
      for: HomeViewModel.self
    )
    register(
      WithdrawnPackagesViewModel.previewInstance(),
      for: WithdrawnPackagesViewModel.self
    )
    register(
      PackagesForWithdrawalViewModel.previewInstance(),
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

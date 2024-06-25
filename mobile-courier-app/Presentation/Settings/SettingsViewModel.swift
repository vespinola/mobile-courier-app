//
//  SettingsViewModel.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-24.
//

import Foundation

final class SettingsViewModel: ObservableObject {
  private let authRepository: AuthRepositoryProtocol

  init(authRepository: AuthRepositoryProtocol) {
    self.authRepository = authRepository
  }

  func doLogout() {
    authRepository.performLogout()
  }
}

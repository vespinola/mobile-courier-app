//
//  LoginViewModel.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-05-04.
//

import Foundation

final class LoginViewModel: ObservableObject {
  @Published var password: String = ""
  @Published var email: String = ""
  @Published var isLoading = false
  @Published var toastMessage: String?

  var buttonIsEnabled: Bool {
    !password.isEmpty && !email.isEmpty
  }

  private let authRepository: AuthRepositoryProtocol
  private let storage: Storage

  init(authRepository: AuthRepositoryProtocol, storage: Storage) {
    self.authRepository = authRepository
    self.storage = storage

    guard let savedEmail = storage.getString(forKey: "userEmail"), !savedEmail.isEmpty else { return }
    self.email = savedEmail
  }

  @MainActor
  func doLogin() async -> Bool {
    do {
      isLoading = true
      try await authRepository.performLogin(email: email, password: password)
      storage.setString(email, forKey: "userEmail")
      isLoading = false
      return true
    } catch {
      isLoading = false
      toastMessage = error.localizedDescription
      return false
    }
  }
}

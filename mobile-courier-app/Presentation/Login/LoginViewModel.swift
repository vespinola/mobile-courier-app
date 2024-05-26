//
//  LoginViewModel.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-05-04.
//

import Foundation

@MainActor
final class LoginViewModel: ObservableObject {
  private enum Constants {
    static let rememberedUserKey = "rememberedUser"
    static let rememberedUsernameKey = "rememberedUsername"
  }
  
  @Published var password: String = ""
  @Published var email: String = ""
  @Published var isToggled = false
  @Published var isLoading = false

  private let storage: Storage

  var buttonIsEnabled: Bool {
    !password.isEmpty && !email.isEmpty
  }

  private let authRepository: AuthRepositoryProtocol

  init(authRepository: AuthRepositoryProtocol, storage: Storage) {
    self.authRepository = authRepository
    self.storage = storage

    self.email = storage.getString(forKey: Constants.rememberedUsernameKey) ?? ""
    self.isToggled = storage.getBool(forKey: Constants.rememberedUserKey)
  }

  func doLogin() async {
    do {
      isLoading = true
      let loginEntity = try await authRepository.performLogin(email: email, password: password)
      isLoading = false
    } catch {
      isLoading = false
    }
  }

  func saveUserPreferences(isOn: Bool) {
    if isOn {
      storage.setBool(isOn, forKey: Constants.rememberedUserKey)
      storage.setString(email, forKey: Constants.rememberedUsernameKey)
    } else {
      storage.delete(forKey: Constants.rememberedUserKey)
      storage.delete(forKey: Constants.rememberedUsernameKey)
    }

    self.email = storage.getString(forKey: Constants.rememberedUsernameKey) ?? ""
    self.isToggled = storage.getBool(forKey: Constants.rememberedUserKey)
  }
}

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
    switch page {
    case .login:
      let apiClient = APIRequestClient()
      let authRepo = AuthRepository(apiRequestClient: apiClient)
      let storage = UserDefaultsStorage()
      LoginView(viewModel: LoginViewModel(
        authRepository: authRepo,
        storage: storage)
      )
    case .profile:
      let apiClient = APIRequestClient()
      let addressRepo = AddressRespository(apiRequestClient: apiClient)
      ProfileView(viewModel: ProfileViewModel(addressesRepository: addressRepo))
    case .home:
      HomeView()
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

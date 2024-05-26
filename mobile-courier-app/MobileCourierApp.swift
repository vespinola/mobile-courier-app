//
//  mobile_courier_appApp.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-05-04.
//

import SwiftUI

@main
struct MobileCourierApp: App {
  let authRepository = AuthRepository(apiRequestClient: APIRequestClient.instance)
  let storage = UserDefaultsStorage()

  var body: some Scene {
    WindowGroup {
      LoginView(viewModel: LoginViewModel(authRepository: authRepository, storage: storage))
    }
  }
}

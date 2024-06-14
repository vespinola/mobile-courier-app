//
//  LoginViewModelMock.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-05-27.
//

import Foundation

extension LoginViewModel {
  static func previewInstance() -> LoginViewModel {
    .init(authRepository: AuthRepositoryMock())
  }
}

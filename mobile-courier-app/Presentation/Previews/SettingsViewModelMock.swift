//
//  SettingsViewModelMock.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-24.
//

import Foundation

extension SettingsViewModel {
  static func previewInstance() -> SettingsViewModel {
    .init(authRepository: AuthRepositoryMock())
  }
}

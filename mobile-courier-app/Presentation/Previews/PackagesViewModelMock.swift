//
//  PackagesViewModelMock.swift
//  mobile-courier-app
//
//  Created by Vladimir Espinola on 2024-06-16.
//

import Foundation

extension PackagesViewModel {
  static func previewInstance() -> PackagesViewModel {
    .init(packagesRepository: PackagesRepositoryMock())
  }
}
